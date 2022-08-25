import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ShippingTypeCard extends StatelessWidget {
  const ShippingTypeCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.r),
      ),
      child: InkWell(
        onTap: () {},
        child: Container(
          height: 70.sp,
          padding: EdgeInsets.symmetric(
            vertical: 12.sp,
            horizontal: 14.sp,
          ),
          child: Row(
            children: [
              const Icon(Icons.local_shipping_rounded),
              SizedBox(
                width: 15.w,
              ),
              Text(
                'Choose Shipping Type',
                style: Theme.of(context).textTheme.headline6,
              ),
              const Spacer(),
              Icon(
                Icons.arrow_forward_ios_rounded,
                size: 18.sp,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
