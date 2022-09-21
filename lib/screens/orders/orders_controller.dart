import 'package:get/get.dart';
import 'package:my_shop/screens/track_order/track_order_controller.dart';

import '../../models/order_item.dart';
import '../../models/order_status_enum.dart';
import 'services/get_all_orders_service.dart';

class OrdersController extends GetxController {
  RxBool isLoading = true.obs;
  RxList<OrderItem> orders = <OrderItem>[].obs;
  RxList<OrderItem> completedOrders = <OrderItem>[].obs;
  RxList<OrderItem> onGoingOrders = <OrderItem>[].obs;

  @override
  void onReady() {
    super.onReady();
    loadOrders();
    filterOrdersAutomatically();
  }

  void trackOrder(String orderId) {
    final order = onGoingOrders.firstWhere((order) => order.orderId == orderId);
    Get.find<TrackOrderController>().order = order;
    Get.toNamed('/track_order');
  }

  Future<void> loadOrders() async {
    isLoading(true);
    final loadedOrders = await getAllOrdersService();
    orders.clear();
    orders.addAll(loadedOrders);
    isLoading(false);
  }
  
  void filterOrdersAutomatically() {
     ever(
      orders,
      (_) {
        completedOrders.clear();
        completedOrders.addAll(orders.where((order) => order.status.name == OrderStatus.completed.name));

        onGoingOrders.clear();
        onGoingOrders.addAll(orders.where((order) => order.status.name == OrderStatus.inDelievery.name));
      },
    );
  }
}

/*

 OrderItem(
        orderId: '10',
        price: 159.99,
        productId: '1',
        productName: 'White T-shirt',
        quantity: 2,
        imageUrl:
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQR6mNeolQnmtuuUJ3SwppHCm0CfRXTBECfOw&usqp=CAU',
        chosenColor: Colors.deepPurple[300]!.value,
        chosenSize: 'M',
        status: OrderStatus.completed),
    OrderItem(
      orderId: '8',
      price: 49.99,
      productId: '2',
      productName: 'Wrella Cardigans',
      quantity: 3,
      imageUrl:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQR6mNeolQnmtuuUJ3SwppHCm0CfRXTBECfOw&usqp=CAU',
      chosenColor: 0xFF46E4CC,
      chosenSize: 'S',
      status: OrderStatus.completed,
    ),
*/
