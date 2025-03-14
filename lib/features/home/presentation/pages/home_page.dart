import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/core/utils/app_colors.dart';
import 'package:todo_app/core/utils/app_images.dart';
import 'package:todo_app/core/utils/app_strings.dart';
import 'package:todo_app/features/auth/manager/auth_provider.dart';
import 'package:todo_app/features/auth/pages/auth_page.dart';
import 'package:todo_app/features/home/presentation/manager/home_provider.dart';
import 'package:todo_app/features/tabs/settings/presentation/pages/settings_tab.dart';
import 'package:todo_app/features/tabs/task/presentation/pages/task_tab.dart';
import 'package:todo_app/features/tabs/task/presentation/widgets/bottom_sheet.dart';

class HomePage extends StatelessWidget {
  static const String routeName = "home";



  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AuthPageProvider?>(context);
    var homeProvider = Provider.of<HomeProvider>(context);
    return Scaffold(
      extendBody: true,
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        title: Text('${AppStrings.welcome} ${provider?.userModel?.username ?? ""}!',
            style: Theme.of(context).textTheme.titleLarge),
        actions: [
          IconButton(
              onPressed: () {
                provider?.logout();
                Navigator.pushNamedAndRemoveUntil(
                    context, AuthPage.routeName, (route) => false);
              },
              icon: Icon(
                Icons.logout,
                color: Theme.of(context).scaffoldBackgroundColor,
              )),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
              context: context,
              isScrollControlled: true,
              isDismissible: false,
              builder: (context) {
                return Container(
                    padding: EdgeInsets.only(
                        bottom: MediaQuery.of(context).viewInsets.bottom),
                    child: AddTaskBottomSheet());
              });
        },
        backgroundColor: AppColor.main,
        elevation: 5,
        child: Icon(
          Icons.add,
          color: AppColor.white,
          size: 30,
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        notchMargin: 8,
        elevation: 0,
        height: 80.h,
        shape: const CircularNotchedRectangle(),
        padding: EdgeInsets.zero,
        child: BottomNavigationBar(
          showUnselectedLabels: false,
          showSelectedLabels: false,
          selectedItemColor: AppColor.main,
          unselectedItemColor: AppColor.grey,
          elevation: 0,
          backgroundColor: Colors.transparent,
          selectedIconTheme: IconThemeData(color: AppColor.main),
          currentIndex: homeProvider?.index ?? 0,
          onTap: (value) {
            homeProvider.changeIndex(value);
          },
          items: const [
            BottomNavigationBarItem(
                icon: ImageIcon(AssetImage(AppImages.iconList)),
                label: AppStrings.label0),
            BottomNavigationBarItem(
                icon: ImageIcon(AssetImage(AppImages.iconSettings)),
                label: AppStrings.label1),
          ],
        ),
      ),
      body: tabs[homeProvider?.index ?? 0],
    );
  }

  List<Widget> tabs = [
    TaskTab(),
    SettingsTab(),
  ];

}
