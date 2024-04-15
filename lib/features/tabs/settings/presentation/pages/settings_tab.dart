import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todo_app/core/utils/app_colors.dart';
import 'package:todo_app/core/utils/app_strings.dart';

class SettingsTab extends StatefulWidget {

  SettingsTab({super.key});

  @override
  State<SettingsTab> createState() => _SettingsTabState();
}

class _SettingsTabState extends State<SettingsTab> {
  String _theme = "Light";
  String _lang = "English";

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 70.h),
      child: SingleChildScrollView(
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              DropdownMenu(
                width: 319.w,
                enableFilter: true,
                  inputDecorationTheme: buildInputDecorationTheme(),
                label: Text(AppStrings.selectTheme, style: Theme.of(context).textTheme.bodyLarge),
                  helperText: AppStrings.themeHelperText,
                  textStyle: Theme.of(context).textTheme.titleMedium!.copyWith(color: Colors.white),
                  menuStyle: MenuStyle(backgroundColor: MaterialStateProperty.all(AppColor.white)) ,
                  onSelected: (theme) {
                    if (theme != null) {
                      setState(() {
                        _theme = theme;
                      });
                    }
                  },
                  dropdownMenuEntries: [
                DropdownMenuEntry(value: "Light", label: AppStrings.lightTheme),
                DropdownMenuEntry(value: "Dark", label: AppStrings.darkTheme),
        
              ]),
              SizedBox(height: 64.h,),
              DropdownMenu(
                width: 319.w,
                enableFilter: true,
                inputDecorationTheme: buildInputDecorationTheme(),
                label: Text(AppStrings.selectLanguage, style: Theme.of(context).textTheme.bodyLarge),
                  menuStyle: MenuStyle(backgroundColor: MaterialStateProperty.all(AppColor.white)) ,
                  helperText: AppStrings.langHelperText,
                  onSelected: (lang) {
                    if (lang != null) {
                      setState(() {
                        _lang = lang;
                      });
                    }
                  },
                  dropdownMenuEntries: [
                DropdownMenuEntry(value: "English", label: "English"),
                DropdownMenuEntry(value: "Arabic", label: "Arabic"),
        
              ]),
            ],
          ),
        ),
      ),
    );
  }

  InputDecorationTheme buildInputDecorationTheme() {
    return InputDecorationTheme(
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: AppColor.main, width: 2, style: BorderStyle.solid), // Set border color to white
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white), // Set focused border color to white
                ),
                labelStyle: TextStyle(color: Colors.white),
                hintStyle: TextStyle(color: Colors.white),
              );
  }
}
