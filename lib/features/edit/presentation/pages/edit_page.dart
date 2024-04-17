import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todo_app/core/utils/app_colors.dart';
import 'package:todo_app/core/utils/app_strings.dart';
import 'package:todo_app/core/widgets/custom_text_field.dart';

class EditPage extends StatelessWidget {
  static const String routeName = "edit";
  const EditPage({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController titleController = TextEditingController();
    TextEditingController detailsController = TextEditingController();
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: 157.h,
            decoration: BoxDecoration(
              color: Theme.of(context).appBarTheme.backgroundColor,
            ),
          ),
          SafeArea(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  /// Title
                  Row(
                    children: [
                      IconButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        icon: const Icon(Icons.arrow_back),
                      ),
                      Text(
                        AppStrings.appName,
                        style: Theme.of(context).textTheme.titleLarge,
                      )
                    ],
                  ),
              
                  /// Edit
                  Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Theme.of(context).bottomAppBarTheme.color,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    margin:
                        EdgeInsets.symmetric(horizontal: 30.w, vertical: 20.h),
                    padding: EdgeInsets.symmetric(horizontal: 11, vertical: 20.h),
                    child: Column(
                      children: [
                        Text(
                          AppStrings.editTask,
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
              
                        ///title
                        // CustomTextField(
                        //     controller: titleController, hint: "Title", label: '', enterValue: '',),
                        //
                        // ///details
                        // CustomTextField(
                        //     controller: detailsController, hint: "Details", label: '', enterValue: '',),
              
                        ///Button
                        ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              backgroundColor: AppColor.main,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(18))),
                            child: Text(
                              AppStrings.saveTask,
                              style: Theme.of(context).textTheme.bodyMedium,
                            ))
                      ],
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
