import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:im_stepper/stepper.dart';
import 'package:my_shop/config/theme/light_theme_colors.dart';

import 'order_item.dart';

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
      body: Column(
        children: [
          const OrderCard(),
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
    );
  }
}
