import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

import '../../../models/order_item.dart';
import '../services/fetch_complete_orders_service.dart';

class CompletedOrdersController extends GetxController {

  final pagingController = PagingController<int, OrderItem>(
    firstPageKey: 1,
  );

  int numOfPages = 1;
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


