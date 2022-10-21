import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '/config/theme/light_theme_colors.dart';
import '/config/translations/strings_enum.dart';
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
          bottom: TabBar(
            indicatorColor: myBlack,
            tabs: [
              Tab(
                child: Text(
                  Strings.onGoing_Orders_Tap_Title.tr,
                  style: Theme.of(context).textTheme.bodyText1!.copyWith(fontSize: 15.sp),
                ),
              ),
              Tab(
                child: Text(
                  Strings.completed_Orders_Tap_Title.tr,
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

class Search extends StatelessWidget {
  const Search({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {},
      icon: ImageIcon(
        const AssetImage('assets/icons/search.png'),
        size: 30.sp,
      ),
    );
  }
}
