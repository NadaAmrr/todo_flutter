import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todo_app/core/remote/firebase_functions.dart';
import 'package:todo_app/models/task_model.dart';

class TaskItemChild extends StatelessWidget {
  TaskModel model;
  Color color;
  Widget widget;
  TaskItemChild({super.key, required this.model, required this.color, required this.widget});

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
                Text(model.title, style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                  color: color
                ),),
                const SizedBox(height: 5,),
                Text(model.details, style: Theme.of(context).textTheme.bodySmall),
              ],
            ),
          ),
          const Spacer(),
          InkWell(
              onTap: () {
                model.isDone = !(model.isDone ?? false);
                FirebaseFunctions.editTask(model);
              },
              child: widget),
        ],
      ),
    );
  }
}

