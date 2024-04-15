import 'package:flutter/material.dart';
import 'package:todo_app/core/utils/app_colors.dart';

class CustomTextField extends StatefulWidget {
 final TextEditingController controller;
 final String hint;
 final String label;
 final String enterValue;
 const CustomTextField({super.key, required this.controller, required this.hint, required this.label, required this.enterValue});

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
 @override
  Widget build(BuildContext context) {
   return Padding(
      padding: EdgeInsets.all(6.0),
      child: TextFormField(
        maxLines: 2,
        style: Theme.of(context).textTheme.bodyMedium!.copyWith(fontSize: 20), // Change text color while typing
        controller: widget.controller, decoration: InputDecoration(
        hintText: widget.hint,
        hintStyle: Theme.of(context).textTheme.bodySmall,
        label: Text(widget.label),
        labelStyle: Theme.of(context).textTheme.bodyMedium,
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppColor.main),
          borderRadius: BorderRadius.circular(12),
        )
      ),
        validator: (value) {
        if (value == null || value.isEmpty) {
          return widget.enterValue;
        } else {
          return null;
        }
        },),
    );
  }
}
