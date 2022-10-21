import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../modules/home/home_controller.dart';

class SearchTextField extends GetView<HomeController> {
  const SearchTextField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onTap: () => Get.toNamed('/search_screen'),
      readOnly: true,
      decoration: InputDecoration(
        hintText: 'Search'.tr,
        prefixIcon: Padding(
          padding: const EdgeInsets.only(left: 10),
          child: IconButton(
            splashRadius: 15,
            icon: ImageIcon(
              const AssetImage('assets/icons/search.png'),
              color: Theme.of(context).iconTheme.color,
            ),
            onPressed: () {},
          ),
        ),
      ),
    );
  }
}
