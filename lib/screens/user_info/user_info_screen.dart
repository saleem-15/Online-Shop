import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'user_info_controller.dart';

class UserInfoScreen extends GetView<UserInfoController> {
  const UserInfoScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height - 100;
    return Scaffold(
      appBar: AppBar(
        iconTheme: Theme.of(context).iconTheme,
        title: Text(
          'User Info',
          style: Theme.of(context).textTheme.headlineSmall,
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.only(
            right: 20.w,
            left: 20.w,
            top: 15.h,
          ),
          constraints: BoxConstraints(
            minHeight: screenHeight,
            maxHeight: double.infinity,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Form(
                key: controller.formKey,
                child: Column(
                  children: [
                    GestureDetector(
                      onTap: controller.pickImage,
                      child: GetBuilder<UserInfoController>(
                        assignId: true,
                        id: 'user_image',
                        builder: (controller) => Stack(
                          children: [
                            controller.image == null
                                ? CircleAvatar(
                                    radius: 50.sp,
                                    backgroundImage: const AssetImage('assets/default_user_image.jpg'),
                                  )
                                : CircleAvatar(
                                    radius: 50.sp,
                                    backgroundImage: FileImage(controller.image!),
                                  ),
                            Positioned(
                              bottom: 3.sp,
                              right: 3.sp,

                              // TODO make the background of the icon white (with photoshop)
                              child: editIcon(context),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    TextFormField(
                      controller: controller.nameController,

                      decoration: const InputDecoration(
                        hintText: 'Full Name',
                      ),
                      validator: controller.nameValidator,
                      textInputAction: TextInputAction.next, // Moves focus to next field
                    ),
                    SizedBox(
                      height: 15.h,
                    ),
                    TextFormField(
                      controller: controller.nickNameController,
                      decoration: const InputDecoration(
                        hintText: 'Nickname',
                      ),
                      validator: controller.nickNameValidator,
                      textInputAction: TextInputAction.next, // Moves focus to next field
                    ),
                    SizedBox(
                      height: 15.h,
                    ),
                    TextFormField(
                      focusNode: controller.dateFocus,
                      // readOnly: true,
                      controller: controller.birthDateController,
                      decoration: const InputDecoration(
                        hintText: 'Date of Birth',
                        suffixIcon: ImageIcon(
                          AssetImage('assets/icons/calendar_icon_32.png'),
                          size: 20,
                        ),
                      ),
                      textInputAction: TextInputAction.next, // Moves focus to next field
                    ),
                    SizedBox(
                      height: 15.h,
                    ),
                    TextFormField(
                      focusNode: controller.emailFocus,
                      controller: controller.emailController,
                      decoration: const InputDecoration(
                        hintText: 'Email',
                      ),
                      validator: controller.emailValidator,
                      textInputAction: TextInputAction.next, // Moves focus to next field
                    ),
                    SizedBox(
                      height: 15.h,
                    ),
                    TextFormField(
                      controller: controller.phoneNumberController,
                      decoration: const InputDecoration(
                        hintText: 'Phone Number',
                      ),
                      validator: controller.phoneNumberValidator,
                      textInputAction: TextInputAction.done, // Moves focus to next field
                    ),
                  ],
                ),
              ),
              ElevatedButton(
                onPressed: controller.updateProfileInfo,
                child: Text(controller.isEditingMode ? 'Update' : 'Continue'),
              ),
              const SizedBox(
                height: 25,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Stack editIcon(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          width: 16.sp,
          height: 16.sp,
          color: Colors.white,
        ),
        ImageIcon(
          const AssetImage('assets/edit_square_icon_72.png'),
          color: Theme.of(context).iconTheme.color,
          size: 28.sp,
        ),
      ],
    );
  }
}
