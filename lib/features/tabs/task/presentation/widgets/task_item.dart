import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/core/remote/firebase_functions.dart';
import 'package:todo_app/core/utils/app_colors.dart';
import 'package:todo_app/core/utils/app_strings.dart';
import 'package:todo_app/features/auth/manager/auth_provider.dart';
import 'package:todo_app/features/edit/presentation/pages/edit_page.dart';
import 'package:todo_app/features/tabs/task/presentation/widgets/check_widget.dart';
import 'package:todo_app/features/tabs/task/presentation/widgets/done_widget.dart';
import 'package:todo_app/features/tabs/task/presentation/widgets/task_item_child.dart';
import 'package:todo_app/models/task_model.dart';

class TaskItem extends StatelessWidget {
  final TaskModel model;
  Color color = AppColor.main;
  Widget widget = CheckWidget();

  TaskItem({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    if (model.isDone == true) {
      widget = const DoneWidget();
      color = AppColor.green;
    }

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 30.w),
      child: Slidable(
        startActionPane: ActionPane(motion: const DrawerMotion(), children: [
          SlidableAction(
              onPressed: (context) {
                FirebaseFunctions.editTask(model);
                // model.isDone = !(model.isDone ?? false);
                Navigator.pushNamed(context, EditPage.routeName, arguments: model);
              },
              label: AppStrings.edit,
              backgroundColor: AppColor.main,
              icon: Icons.edit),
          SlidableAction(
              onPressed: (context) {
                FirebaseFunctions.deleteTask(model.id);
              },
              label: AppStrings.delete,
              backgroundColor: AppColor.red,
              icon: Icons.delete)
        ]),
        child: Container(
          // height: 100,
          decoration: BoxDecoration(
              color: Theme.of(context).bottomAppBarTheme.color,
              borderRadius: const BorderRadius.only(
                topRight: Radius.circular(15),
                bottomRight: Radius.circular(15),
              )),
          child: InkWell(
              onTap: () {
                model.isDone = !(model.isDone ?? false);
                FirebaseFunctions.editTask(model);
              },
              child: TaskItemChild(
                title: model.title,
                color: color,
                subTitle: model.details,
                widget: widget,
              )),
        ),
      ),
    );
  }
}
