import 'package:flutter/material.dart';
import 'package:todo_app/core/utils/app_strings.dart';
import 'package:todo_app/features/auth/pages/login_tab.dart';
import 'package:todo_app/features/auth/pages/register_tab.dart';

class AuthPage extends StatelessWidget {
  static const String routeName = "auth";
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          bottom: TabBar(
            indicatorWeight: 5,
            indicatorColor: Theme.of(context).indicatorColor,
            tabs: [
              Text(
                AppStrings.register,
                style: Theme.of(context).textTheme.titleLarge,
              ),
              Text(
                AppStrings.login,
                style: Theme.of(context).textTheme.titleLarge,
              ),
            ],
          ),
          title: Text(AppStrings.appName,
              style: Theme.of(context).textTheme.titleLarge),
        ),
        body: const TabBarView(
          children: [
            RegisterTab(),
            LoginTab(),
          ],
        ),
      ),
    );
  }
}
