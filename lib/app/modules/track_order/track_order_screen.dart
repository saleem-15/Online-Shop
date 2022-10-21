import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:im_stepper/stepper.dart';

import '../../modules/track_order/track_order_controller.dart';
import '../orders/components/order_item.dart';
import '/config/theme/light_theme_colors.dart';

class TrackOrder extends StatelessWidget {
  const TrackOrder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: Theme.of(context).iconTheme,
        title: Text(
          'Track Order',
          style: Theme.of(context).textTheme.headlineSmall,
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 5.h),
        child: Column(
          children: [
            GetBuilder<TrackOrderController>(
              builder: (controller) {
                return OrderItemTile(order: controller.order);
              },
            ),
            IconStepper(
              enableStepTapping: false,
              enableNextPreviousButtons: false,
              stepRadius: 12.sp,
              activeStepColor: myBlack,
              lineColor: Colors.grey,
              activeStep: 2,
              // ensure that active step dont have border araound it
              activeStepBorderColor: Colors.transparent,
              // activeStepBorderPadding: 20,
              lineDotRadius: 1,

              icons: const [
                Icon(Icons.done, color: Colors.white),
                Icon(Icons.done, color: Colors.white),
                Icon(Icons.done, color: Colors.white),
                Icon(Icons.done, color: Colors.white),
              ],
            )
          ],
        ),
      ),
    );
  }
}
