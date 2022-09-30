import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:my_shop/config/theme/light_theme_colors.dart';

import 'components/completed_orders_tab.dart';
import 'components/ongoing_orders_tab.dart';

class OrdersScreen extends StatelessWidget {
  const OrdersScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          iconTheme: Theme.of(context).iconTheme,
          title: Text(
            'Orders'.tr,
            style: Theme.of(context).textTheme.headlineSmall,
          ),
          actions: [
            IconButton(
              onPressed: () {},
              icon: ImageIcon(
                const AssetImage('assets/icons/search.png'),
                size: 30.sp,
              ),
            )
          ],
          bottom: TabBar(
            indicatorColor: myBlack,
            tabs: [
              Tab(
                child: Text(
                  'On Going'.tr,
                  style: Theme.of(context).textTheme.bodyText1!.copyWith(fontSize: 15.sp),
                ),
              ),
              Tab(
                child: Text(
                  'Completed'.tr,
                  style: Theme.of(context).textTheme.bodyText1!.copyWith(fontSize: 15.sp),
                ),
              ),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            OngoingOrdersTab(),
            CompletedOrdersTab(),
          ],
        ),
      ),
    );
  }
}
