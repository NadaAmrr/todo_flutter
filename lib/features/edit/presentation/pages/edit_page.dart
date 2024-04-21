import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todo_app/core/remote/firebase_functions.dart';
import 'package:todo_app/core/utils/app_colors.dart';
import 'package:todo_app/core/utils/app_strings.dart';
import 'package:todo_app/core/widgets/custom_text_field.dart';
import 'package:todo_app/models/task_model.dart';

class EditPage extends StatefulWidget {
  static const String routeName = "edit";

  const EditPage({super.key});

  @override
  State<EditPage> createState() => _EditPageState();
}

class _EditPageState extends State<EditPage> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController titleController = TextEditingController();
  TextEditingController detailsController = TextEditingController();
  bool first = true;
  late DateTime selectedDate;

  @override
  Widget build(BuildContext context) {
    TaskModel model = ModalRoute.of(context)?.settings.arguments as TaskModel;
    if (first) {
      titleController.text = model.title ?? "";
      detailsController.text = model.details ?? "";
      selectedDate = DateTime.fromMillisecondsSinceEpoch(model.date!);
      first = false;
    }
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
                  Form(
                    key: formKey,
                    child: Container(
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
                          CustomTextField(
                              controller: titleController, title: AppStrings.title, lines: 3, vertical: 20, horizontal: 20,),

                          ///details
                          CustomTextField(
                            controller: detailsController, title: AppStrings.details, lines: 3, vertical: 20, horizontal: 20,),

                          ///
                          Container(
                              alignment: Alignment.centerLeft,
                              padding: const EdgeInsets.symmetric(vertical: 12),
                              child: Text(AppStrings.selectTime,
                                  style: Theme.of(context).textTheme.bodyLarge)),
                          ///
                          InkWell(
                              onTap: () {
                                selectDate(context: context);
                              },
                              child: Text(selectedDate.toString().split(" ").first,
                                  // Text(selectedDate.toString().substring(0,10),
                                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(fontSize: 20))),
                          SizedBox(height: 40.h,),
                          ///Button
                          ElevatedButton(
                              onPressed: () {
                                if (formKey.currentState!.validate()) {
                                  TaskModel task = TaskModel(
                                    id: model.id,
                                      isDone: model.isDone,
                                      title: titleController.text,
                                      userId: FirebaseAuth.instance.currentUser!.uid,
                                      details: detailsController.text,
                                      date: DateUtils.dateOnly(selectedDate).millisecondsSinceEpoch);
                                  FirebaseFunctions.editTask(task);
                                  Navigator.pop(context);
                                }
                              },
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
                  ),
                ],
              ),
            ),
          )
        ],
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
