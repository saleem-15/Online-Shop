import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import '../../../models/order_item.dart';
import '../services/fetch_complete_orders_service.dart';

class CompletedOrdersController extends GetxController {
  int numOfPages = 1;

  final pagingController = PagingController<int, OrderItem>(
    firstPageKey: 1,
  );

  int setNumOfPages = 1;
  int totalNumOfProducts = 1;

  @override
  void onInit() {
    pagingController.addPageRequestListener((pageKey) async {
      fethcOnGoingOrders(pageKey);
    });
    super.onInit();
  }

  Future<void> fethcOnGoingOrders(int pageKey) async {
    try {
      final newOrders = await fetchCompletedOrdersService(pageKey);

      final isLastPage = numOfPages == pageKey;

      if (isLastPage) {
        pagingController.appendLastPage(newOrders);
      } else {
        final nextPageKey = pageKey + 1;
        pagingController.appendPage(newOrders, nextPageKey);
      }
    } catch (error) {
      pagingController.error = error;
      rethrow;
    }
  }

  // void trackOrder(String orderId) {
  //   final order = onGoingOrders.firstWhere((order) => order.orderId == orderId);
  //   Get.find<TrackOrderController>().order = order;
  //   Get.toNamed('/track_order');
  // }

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
