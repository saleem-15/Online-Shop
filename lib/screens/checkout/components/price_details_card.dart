import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PriceDetailsCard extends StatelessWidget {
  const PriceDetailsCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.r),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 16.sp,
          vertical: 18.sp,
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Amount'),
                Text(
                  '\$1,970',
                  style: Theme.of(context).textTheme.bodyText1!.copyWith(fontSize: 15.sp),
                ),
              ],
            ),
            SizedBox(height: 20.sp),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Amount',
                ),
                Text(
                  '-',
                  style: Theme.of(context).textTheme.bodyText1!.copyWith(fontSize: 15.sp),
                ),
              ],
            ),
            SizedBox(height: 15.sp),
            const Divider(),
            SizedBox(height: 5.sp),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Amount'),
                Text(
                  '-',
                  style: Theme.of(context).textTheme.bodyText1!.copyWith(fontSize: 15.sp),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
