import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todo_app/core/utils/app_colors.dart';
import 'package:todo_app/core/utils/app_strings.dart';

class CustomTextField extends StatefulWidget {
  final TextEditingController controller;
  final String title;
  final int lines;
  final double vertical;
  final double horizontal;
  // final String hint;
  // final String label;
  // final String enterValue;
  const CustomTextField(
      {super.key,
      required this.controller,
      required this.title,
      required this.lines,
      required this.vertical,
      required this.horizontal});

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          vertical: widget.vertical, horizontal: widget.horizontal),
      child: TextFormField(
        maxLines: widget.lines,
        style: Theme.of(context)
            .textTheme
            .bodyMedium!
            .copyWith(fontSize: 20),
        controller: widget.controller,
        decoration: InputDecoration(
          hintStyle: Theme.of(context).textTheme.bodySmall,
          label: Text(
            widget.title,
            style:
                Theme.of(context).textTheme.bodyLarge!.copyWith(fontSize: 20),
          ),
          // labelStyle: Theme.of(context).textTheme.bodyMedium,
          // labelStyle: Theme.of(context).textTheme.titleLarge,
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                  width: 2,
                  color: Theme.of(context).textTheme.bodyMedium!.color ??
                      AppColor.grey)),
          enabledBorder:
              OutlineInputBorder(borderSide: BorderSide(color: AppColor.grey)),
          errorBorder:
              OutlineInputBorder(borderSide: BorderSide(color: AppColor.red)),
        ),

        //   decoration: InputDecoration(
        //   hintText: widget.hint,
        //   hintStyle: Theme.of(context).textTheme.bodySmall,
        //   label: Text(widget.label),
        //   labelStyle: Theme.of(context).textTheme.bodyMedium,
        //   focusedBorder: OutlineInputBorder(
        //     borderSide: BorderSide(color: AppColor.main),
        //     borderRadius: BorderRadius.circular(12),
        //   )
        // ),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return "${"${AppStrings.enter} ${widget.title}"}.";
          } else {
            return null;
          }
        },
      ),
    );
  }
}
