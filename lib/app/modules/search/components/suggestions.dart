import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../search_controller.dart';

class Suggestions extends GetView<SearchController> {
  const Suggestions({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).scaffoldBackgroundColor,
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(
              top: 5.sp,
              right: 15.w,
              left: 15.w,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Recent'.tr,
                  style: Theme.of(context).textTheme.headline6,
                ),

                ///delete all button
                // TextButton(
                //   onPressed: () {},
                //   child: Text(
                //     'Clear All',
                //     style: Theme.of(context).textTheme.bodyLarge,
                //   ),
                // ),
              ],
            ),
          ),
          Divider(
            indent: 15.w,
            endIndent: 15.w,
          ),
          Expanded(
            child: Obx(
              () => ListView.builder(
                padding: EdgeInsets.only(
                  right: 5.w,
                  left: 5.w,
                ),
                itemCount: controller.recentSearches.length,
                itemBuilder: (context, index) => ListTile(
                  onTap: () => controller
                      .searchSuggestion(controller.recentSearches[index]),
                  leading: SizedBox(
                    width: 240.w,
                    child: Text(
                      controller.recentSearches[index],
                      maxLines: 1,
                      style: Theme.of(context)
                          .textTheme
                          .bodyText1!
                          .copyWith(fontSize: 16.sp),
                    ),
                  ),
                  trailing: IconButton(
                    onPressed: () => controller.deleteSuggestionAtIndex(index),
                    iconSize: 27.sp,
                    icon: const ImageIcon(
                        AssetImage('assets/icons/close_square_icon.png')),
                    color: Theme.of(context).listTileTheme.iconColor,
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
