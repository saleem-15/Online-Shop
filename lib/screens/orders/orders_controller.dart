import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_shop/screens/orders/components/order_item.dart';
import 'package:my_shop/screens/track_order/track_order_controller.dart';
import 'package:my_shop/screens/track_order/track_order_screen.dart';

import '../../models/order_item.dart';

class OrdersController extends GetxController {
  RxList<OrderItem> completedOrders = [
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
  ].obs;

  RxList<OrderItem> onGoingOrders = [
    OrderItem(
      orderId: '1',
      price: 385,
      productId: '3',
      productName: 'Wrella Cardigans',
      quantity: 1,
      imageUrl:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQR6mNeolQnmtuuUJ3SwppHCm0CfRXTBECfOw&usqp=CAU',
      chosenColor: 0xFF46E4CC,
      chosenSize: 'L',
      status: OrderStatus.inDelievery,
    ),
    OrderItem(
      orderId: '6',
      price: 385,
      productId: '3',
      productName: 'Wrella Cardigans',
      quantity: 1,
      imageUrl:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQR6mNeolQnmtuuUJ3SwppHCm0CfRXTBECfOw&usqp=CAU',
      chosenColor: 0xFF46E4CC,
      chosenSize: 'L',
      status: OrderStatus.inDelievery,
    ),
    OrderItem(
      orderId: '2',
      price: 385,
      productId: '3',
      productName: 'Wrella Cardigans',
      quantity: 1,
      imageUrl:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQR6mNeolQnmtuuUJ3SwppHCm0CfRXTBECfOw&usqp=CAU',
      chosenColor: 0xFF46E4CC,
      chosenSize: 'L',
      status: OrderStatus.inDelievery,
    ),
  ].obs;

  void trackOrder(String orderId) {
    final order = onGoingOrders.firstWhere((order) => order.orderId == orderId);
    Get.find<TrackOrderController>().order = order;
    Get.to(() => const TrackOrder());
  }
}
