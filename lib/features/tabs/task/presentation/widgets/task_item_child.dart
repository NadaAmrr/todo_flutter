import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TaskItemChild extends StatelessWidget {
  String title;
  String subTitle;
  Color color;
  Widget widget;
  TaskItemChild({super.key, required this.title, required this.color, required this.subTitle, required this.widget});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 17.w, vertical: 17.h),
      child: Row(
        children: [
          Container(
            width: 3.w,
            height: 53.h,
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(10)
            ),
          ),
          SizedBox(
            width: 25.w,
          ),
          SizedBox(
            width: 200.w,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(title, style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                  color: color
                ),),
                const SizedBox(height: 5,),
                Text(subTitle, style: Theme.of(context).textTheme.bodySmall),
              ],
            ),
          ),
          const Spacer(),
          widget,
        ],
      ),
    );
  }
}

