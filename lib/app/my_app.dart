import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todo_app/core/utils/app_strings.dart';
import 'package:todo_app/core/utils/app_theme.dart';
import 'package:todo_app/features/auth/pages/auth_page.dart';
import 'package:todo_app/features/edit/presentation/pages/edit_page.dart';
import 'package:todo_app/features/home/presentation/pages/home_page.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(412, 870),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, child) => MaterialApp(
        debugShowCheckedModeBanner: false,
        title: AppStrings.appName,
        theme: AppTheme.darkTheme,
        darkTheme: AppTheme.darkTheme,
        initialRoute: AuthPage.routeName,
        routes: {
          AuthPage.routeName: (context) => const AuthPage(),
          HomePage.routeName: (context) => const HomePage(),
          EditPage.routeName: (context) => EditPage(),
        },
      ),
    );
  }
}
