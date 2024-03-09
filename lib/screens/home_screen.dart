import 'package:flutter/material.dart';
import 'package:todo/screens/addTask_bottomSheet.dart';
import 'package:todo/screens/tabs/settingsTab.dart';
import 'package:todo/screens/tabs/task_tab.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = "Home";
  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int index = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      backgroundColor: Color(0xffeef6ec),
      // backgroundColor: Color(0xffdfecdb),
      appBar: AppBar(
        title: Text("To Do"),
        backgroundColor: Colors.blueGrey,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
          side: BorderSide(color: Color(0xffeef6ec), width: 3),
        ),
        onPressed: () {
          showModalBottomSheet(
            backgroundColor: Colors.transparent,
              context: context,
              isScrollControlled: true,
              isDismissible: false,
              builder: (context) {
                return AddTaskBottomSheet();
              });
        },
        backgroundColor: Colors.blueGrey,
        child: Icon(
          Icons.add,
          color: Color(0xffeef6ec),
          size: 30,
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.blueGrey,
        notchMargin: 8,
        height: 60,
        shape: CircularNotchedRectangle(),
        padding: EdgeInsets.zero,
        child: BottomNavigationBar(
          currentIndex: 0,
          onTap: (value) {
            index = value;
            setState(() {});
          },
          backgroundColor: Colors.transparent,
          elevation: 0,
          showUnselectedLabels: false,
          showSelectedLabels: false,
          selectedItemColor: Color(0xffeef6ec),
          unselectedItemColor: Colors.black,
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.task), label: ""),
            BottomNavigationBarItem(icon: Icon(Icons.settings), label: ""),
          ],
        ),
      ),
      body: tabs[index],
    );
  }

  List<Widget> tabs = [
    TaskTab(),
    SettingsTab(),
  ];
}
