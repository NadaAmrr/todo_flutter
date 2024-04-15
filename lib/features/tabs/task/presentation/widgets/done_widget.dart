import 'package:flutter/material.dart';
import 'package:todo_app/core/utils/app_colors.dart';
import 'package:todo_app/core/utils/app_strings.dart';

class DoneWidget extends StatelessWidget {
  const DoneWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(AppStrings.done, style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, fontFamily: 'Poppins', color: AppColor.green),);
  }
}
