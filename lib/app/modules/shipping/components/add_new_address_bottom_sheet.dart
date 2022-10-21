import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../config/theme/light_theme_colors.dart';
import '../../../modules/shipping/controllers/shipping_address_details_controller.dart';
import '/config/theme/my_styles.dart';

/// its used to add edit shipping address details OR to add a new shipping address
class ShippingAddressDetailsSheet extends GetView<ShippingAddressDetailsController> {
  const ShippingAddressDetailsSheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.antiAlias,
      padding: EdgeInsets.only(
        left: 15.w,
        right: 15.w,
        bottom: 20.h,
      ),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primaryContainer,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(40.r),
          topRight: Radius.circular(40.r),
        ),
      ),
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Form(
          key: controller.formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 7.h,
              ),
              Center(
                child: Container(
                  width: 60.sp,
                  height: 3.sp,
                  decoration: BoxDecoration(
                    color: const Color(0xffe0e0e0),
                    borderRadius: BorderRadius.circular(10.r),
                  ),
                ),
              ),
              SizedBox(
                height: 15.h,
              ),
              Center(
                child: Text(
                  'Address Details'.tr,
                  style: Theme.of(context).textTheme.headline5,
                ),
              ),
              Divider(
                height: 30.h,
              ),
              Text(
                'Address Name'.tr,
                style: Theme.of(context).textTheme.headline6,
              ),
              const SizedBox(
                height: 5,
              ),
              TextFormField(
                controller: controller.addressNameController,
                textInputAction: TextInputAction.next,
                validator: controller.addressNameValidator,
              ),
              const SizedBox(
                height: 25,
              ),
              Text(
                'Address Details'.tr,
                style: Theme.of(context).textTheme.headline6,
              ),
              TextFormField(
                controller: controller.addressController,
                textInputAction: TextInputAction.done,
                validator: controller.addressValidator,
              ),
              Row(
                children: [
                  Obx(
                    () => SizedBox(
                      height: 60,
                      width: 60,
                      child: FittedBox(
                        fit: BoxFit.fill,
                        child: Checkbox(
                          value: controller.isDefaultAddress.value,
                          onChanged: controller.onCheckboxPressed,
                        ),
                      ),
                    ),
                  ),
                  Text('Make it as the default address'.tr),
                ],
              ),
              const SizedBox(
                height: 8,
              ),
              Row(
                children: [
                  if (controller.isEditingMode)
                    Expanded(
                      child: ElevatedButton(
                        onPressed: controller.onDeleteButtonPressed,
                        style: MyStyles.getGreyElevatedButtonStyle(isLightTheme: !Get.isDarkMode)
                            .copyWith(backgroundColor: MaterialStateProperty.all(lightRed)),
                        child: Text('Delete'.tr),
                      ),
                    ),
                  if (controller.isEditingMode)
                    const SizedBox(
                      width: 10,
                    ),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: controller.onButtonPressed,
                      child: Text(controller.isEditingMode ? 'Update'.tr : 'Add'.tr),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
