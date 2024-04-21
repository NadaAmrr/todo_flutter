import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/core/remote/firebase_functions.dart';
import 'package:todo_app/core/utils/app_colors.dart';
import 'package:todo_app/core/utils/app_images.dart';
import 'package:todo_app/core/utils/app_strings.dart';
import 'package:todo_app/core/widgets/custom_text_field.dart';
import 'package:todo_app/features/auth/manager/auth_provider.dart';
import 'package:todo_app/features/home/presentation/pages/home_page.dart';

class LoginTab extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  LoginTab({super.key});

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AuthPageProvider>(context);
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 24.h, horizontal: 24.w),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              SizedBox(
                height: 20.h,
              ),

              /// Logo
              Icon(Icons.lock, size: 100, color: AppColor.main),

              /// Login
              Text(AppStrings.login,
                  style: Theme.of(context).textTheme.bodyLarge),
              const SizedBox(height: 12),
              /// email
              CustomTextField(
                controller: emailController,
                title: AppStrings.email,
                lines: 1,
                vertical: 15.0.h,
                horizontal: 0.w,
              ),

              /// password
              CustomTextField(
                controller: passwordController,
                title: AppStrings.pass,
                lines: 1,
                vertical: 30.h,
                horizontal: 0.w,
              ),
              const SizedBox(height: 12),
              /// sign in button
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: AppColor.main,
                    minimumSize: Size(double.infinity, 50.h)),
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    // Navigate the user to the Home page
                    FirebaseFunctions.login(onSuccess: () {
                      provider.initUser();
                      Navigator.pushNamedAndRemoveUntil(
                          context, HomePage.routeName, (route) => false);
                    }, onError: (errorMessage) {
                      showDialog(
                          context: context,
                          barrierDismissible: false,
                          builder: (context) {
                            return AlertDialog(
                              title: Text(
                                AppStrings.error,
                                style: Theme.of(context).textTheme.titleLarge,
                              ),
                              content: Text(errorMessage, style: Theme.of(context).textTheme.bodyLarge,),
                              actions: [
                                ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                        backgroundColor: AppColor.main
                                    ),
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },

                                    child: const Text(AppStrings.tryAgain))
                              ],
                            );
                          });
                    }, email: emailController.text, password: passwordController.text);
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text(AppStrings.fillInputs)),
                    );
                  }
                },
                child: Text(
                  AppStrings.login,
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              ),
              const SizedBox(height: 24),
              /// google + apple
              Row(
                children: [
                  Expanded(child: Divider(thickness: 0.5,color: AppColor.grey,)),
                  Text("Or Continue with", style: Theme.of(context).textTheme.bodySmall,),
                  Expanded(child: Divider(thickness: 0.5,color: AppColor.grey,)),
                ],
              ),
              const SizedBox(height: 24),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(border: Border.all(color: Colors.white), borderRadius: BorderRadius.circular(16), color: AppColor.grey),
                      child: Image.asset(AppImages.google, height: 40,)),
                  const SizedBox(width: 10,),
                  Container(
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(border: Border.all(color: Colors.white), borderRadius: BorderRadius.circular(16), color: AppColor.grey),
                      child: Image.asset(AppImages.apple, height: 40,)),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
