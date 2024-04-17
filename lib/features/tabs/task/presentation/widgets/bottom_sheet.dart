import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todo_app/core/remote/firebase_functions.dart';
import 'package:todo_app/core/utils/app_colors.dart';
import 'package:todo_app/core/utils/app_strings.dart';
import 'package:todo_app/core/widgets/custom_text_field.dart';
import 'package:todo_app/models/task_model.dart';

class AddTaskBottomSheet extends StatefulWidget {
  const AddTaskBottomSheet({super.key});

  @override
  State<AddTaskBottomSheet> createState() => _AddTaskBottomSheetState();
}

class _AddTaskBottomSheetState extends State<AddTaskBottomSheet> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  var selectedDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    TextEditingController titleController = TextEditingController();
    TextEditingController detailsController = TextEditingController();
    return SingleChildScrollView(
      child: Container(
        color: Theme.of(context).bottomAppBarTheme.color,
        padding: EdgeInsets.symmetric(horizontal: 44.w, vertical: 22.h),
        child: Form(
          key: formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 12.0),
                child: Text(AppStrings.addTask,
                    style: Theme.of(context).textTheme.bodyLarge),
              ),
              CustomTextField(
                controller: titleController,
                // hint: AppStrings.hintTitle,
                // label: AppStrings.title,
                // enterValue: AppStrings.enterTitle,
                title: AppStrings.title, lines: 2, vertical: 20, horizontal: 0,
              ),
              CustomTextField(
                controller: detailsController,
                title: AppStrings.details, lines: 2, vertical: 20, horizontal: 0,
              ),
              // CustomTextField(
              //   controller: detailsController,
              //   hint: AppStrings.hintDetails,
              //   label: AppStrings.details,
              //   enterValue: AppStrings.enterDetails,
              // ),
              Container(
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  child: Text(AppStrings.selectTime,
                      style: Theme.of(context).textTheme.bodyLarge)),
              InkWell(
                  onTap: () {
                    selectDate(context: context);
                  },
                  child: Text(selectedDate.toString().split(" ").first,
                      // Text(selectedDate.toString().substring(0,10),
                      style: Theme.of(context).textTheme.bodyMedium)),

              ///Button
              Padding(
                padding: const EdgeInsets.all(18.0),
                child: ElevatedButton(
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        TaskModel task = TaskModel(
                            title: titleController.text,
                            userId: FirebaseAuth.instance.currentUser!.uid,
                            details: detailsController.text,
                            date: DateUtils.dateOnly(selectedDate).millisecondsSinceEpoch);
                        FirebaseFunctions.addTask(task);
                            // .then((value) =>
                      Navigator.pop(context);
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColor.main,
                        minimumSize: Size(double.infinity, 50.h),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18))),
                    child: Text(AppStrings.saveTask,
                        style: Theme.of(context).textTheme.bodyMedium)),
              )
            ],
          ),
        ),
      ),
    );
  }

  selectDate({context}) async {
    DateTime? chosenDate = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime.now(),
        lastDate: DateTime.now().add(Duration(days: 365)));
    if (chosenDate != null) {
      selectedDate = chosenDate;
      setState(() {});
    }
  }
}
