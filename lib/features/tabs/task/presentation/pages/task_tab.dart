import 'package:date_picker_timeline/date_picker_timeline.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todo_app/core/remote/firebase_functions.dart';
import 'package:todo_app/core/utils/app_colors.dart';
import 'package:todo_app/core/utils/app_strings.dart';
import 'package:todo_app/features/tabs/task/presentation/widgets/task_item.dart';
import 'package:todo_app/models/task_model.dart';

class TaskTab extends StatefulWidget {

  TaskTab({super.key});

  @override
  State<TaskTab> createState() => _TaskTabState();
}

class _TaskTabState extends State<TaskTab> {
  var selectedDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        Stack(
          children: [
            Container(
              padding: EdgeInsets.only(top: 10),
              decoration: BoxDecoration(
                  color: AppColor.main,
              ),
              height: 50,
            ),
            SizedBox(
              height: 100,
              child: DatePicker(
                DateTime.now(),
                daysCount: 365,
                initialSelectedDate: selectedDate,
                selectionColor: Theme.of(context).primaryColor,
                selectedTextColor: AppColor.main,
                dateTextStyle: Theme.of(context).textTheme.bodyMedium!.copyWith(fontSize: 30, fontWeight: FontWeight.w500),
                dayTextStyle: Theme.of(context).textTheme.bodyMedium!.copyWith(fontSize: 14, fontWeight: FontWeight.w600),
                monthTextStyle: Theme.of(context).textTheme.bodyMedium!.copyWith(fontSize: 14, fontWeight: FontWeight.w600),
                locale: "en",
                onDateChange: (date) {
                  setState(() {
                    selectedDate = date;
                  });
                },
              ),
            ),
          ],
        ),
        SizedBox(height: 25.h),
        Expanded(
          child: StreamBuilder(
            stream: FirebaseFunctions.getRealTimeTask(selectedDate),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(child: CircularProgressIndicator(color: AppColor.main,));
              }
              if (snapshot.hasError) {
                return Column(
                  children: [
                    Text(AppStrings.error, style: Theme.of(context).textTheme.bodyMedium!.copyWith(color: AppColor.red),),
                    ElevatedButton(onPressed: () {
                    }, child: Text(AppStrings.tryAgain, style: Theme.of(context).textTheme.bodyMedium,))
                  ],
                );
              }
              List<TaskModel> tasksList = snapshot.data?.docs.map((e) => e.data()).toList() ?? [];
              if (tasksList.isEmpty) {
                return Center(child: Text(AppStrings.noTasks, style: Theme.of(context).textTheme.bodyMedium,));
              }
              return ListView.separated(
                itemBuilder: (context, index) {
                  return TaskItem(model: tasksList[index]);
                },
                itemCount: tasksList.length,
                separatorBuilder: (BuildContext context, int index) {
                  return SizedBox(height: 25.h);
                },
              );
            },
          ),
        )
      ],
    );
  }
}
