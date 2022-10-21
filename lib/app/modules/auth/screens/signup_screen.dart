import 'dart:developer';

import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'package:my_shop/config/theme/my_styles.dart';

import '../controllers/signup_controller.dart';

class SignupScreen extends GetView<SignupController> {
  const SignupScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    RxBool isShowPassword = false.obs;
    return Scaffold(
      appBar: AppBar(
        iconTheme: Theme.of(context).iconTheme,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(
            right: 15.w,
            left: 15.w,
            top: 15.h,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Craete Your',
                style: Theme.of(context).textTheme.headline2,
              ),
              Text(
                'Account',
                style: Theme.of(context).textTheme.headline2,
              ),
              SizedBox(
                height: 40.sp,
              ),

              Form(
                key: controller.formKey,
                // the textField is wrapped in (theme) so when the textField has Focus the icon color
                //(in the textField) change to my specific color
                child: Theme(
                  data: Theme.of(context).copyWith(
                    colorScheme: ThemeData().colorScheme.copyWith(
                          primary: Theme.of(context).iconTheme.color,
                        ),
                  ),
                  child: Column(
                    children: [
                      TextFormField(
                        controller: controller.emailController,
                        validator: controller.emailFieldValidator,
                        decoration: InputDecoration(
                          hintText: 'Email',
                          prefixIcon: Container(
                            width: 60,
                            padding: EdgeInsets.only(left: 5.sp),
                            child: const Icon(Icons.email_rounded),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 15.h,
                      ),
                      Obx(
                        () => TextFormField(
                          controller: controller.passwordController,
                          validator: controller.passwordFieldValidator,
                          obscureText: isShowPassword.isTrue,
                          decoration: InputDecoration(
                            hintText: 'Password',
                            prefixIcon: Container(
                              width: 60,
                              padding: EdgeInsets.only(left: 5.sp),
                              child: const ImageIcon(
                                  AssetImage('assets/icons/lock_icon_32.png')),
                            ),
                            suffixIcon: IconButton(
                              splashRadius: 5,
                              onPressed: () => isShowPassword.toggle(),
                              icon: ImageIcon(
                                AssetImage(
                                  isShowPassword.isTrue
                                      ? 'assets/icons/show_icon_32.png'
                                      : 'assets/icons/hide_icon_32.png',
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 40.h,
              ),
              ElevatedButton(
                onPressed: controller.onSignupButtonPressed,
                child: const Text('Sign up'),
              ),
              SizedBox(
                height: 50.h,
              ),
              //
              //divider With text in middle
              SizedBox(
                width: MediaQuery.of(context).size.width,
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Expanded(
                      child: Divider(
                        endIndent: 10.h,
                      ),
                    ),
                    const Text('or Continue with'),
                    Expanded(
                      child: Divider(
                        indent: 10.h,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20.h,
              ),
              ElevatedButton.icon(
                style: MyStyles.getSignupWithGoogleButtonStyle(),
                onPressed: () {
                  log('d');
                },
                icon: Image.asset(
                  'assets/facebook.png',
                  width: 30.sp,
                ),
                label: Text(
                  'Continue with Facebook',
                  style: Theme.of(context)
                      .textTheme
                      .bodyText1!
                      .copyWith(fontSize: 16.sp),
                ),
              ),
              SizedBox(
                height: 20.h,
              ),
              ElevatedButton.icon(
                style: MyStyles.getSignupWithGoogleButtonStyle(),
                onPressed: () {
                  log('d');
                },
                icon: Image.asset(
                  'assets/google.png',
                  width: 30.sp,
                ),
                label: Text(
                  'Continue with Google',
                  style: Theme.of(context)
                      .textTheme
                      .bodyText1!
                      .copyWith(fontSize: 16.sp),
                ),
              ),
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.center,
              //   children: [
              //     Container(
              //       padding: EdgeInsets.symmetric(
              //         horizontal: 30.sp,
              //         vertical: 12.sp,
              //       ),
              //       decoration: BoxDecoration(
              //         border: Border.all(
              //           color: Theme.of(context).dividerColor,
              //           width: .3.sp,
              //         ),
              //         borderRadius: BorderRadius.circular(15.r),
              //       ),
              //       child: Image.asset(
              //         'assets/facebook.png',
              //         width: 35.sp,
              //       ),
              //     ),
              //     SizedBox(
              //       width: 20.w,
              //     ),
              //     Container(
              //       padding: EdgeInsets.symmetric(
              //         horizontal: 30.sp,
              //         vertical: 12.sp,
              //       ),
              //       decoration: BoxDecoration(
              //         border: Border.all(
              //           color: Theme.of(context).dividerColor,
              //           width: .3.sp,
              //         ),
              //         borderRadius: BorderRadius.circular(15.r),
              //       ),
              //       child: Image.asset(
              //         'assets/google.png',
              //         width: 35.sp,
              //       ),
              //     ),
              //   ],
              // ),
              SizedBox(
                height: 20.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Already have an account?  ',
                    style: Theme.of(context)
                        .textTheme
                        .bodyText2!
                        .copyWith(color: Theme.of(context).hintColor),
                  ),
                  GestureDetector(
                    onTap: controller.goToSignin,
                    child: Text(
                      'Sign in',
                      style: Theme.of(context)
                          .textTheme
                          .bodyText1!
                          .copyWith(fontSize: 15.sp),
                    ),
                  )
                ],
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
}
