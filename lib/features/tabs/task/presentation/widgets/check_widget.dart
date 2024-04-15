

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todo_app/core/utils/app_colors.dart';
import 'package:todo_app/core/utils/app_images.dart';

class CheckWidget extends StatelessWidget {
  const CheckWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 34.h,
        width: 69.w,
        decoration: BoxDecoration(
            color: AppColor.main,
            borderRadius: BorderRadius.circular(12)
        ),
        child: ImageIcon(const AssetImage(AppImages.iconCheck), color: AppColor.white,));
  }
}
