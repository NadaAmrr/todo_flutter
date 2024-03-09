import 'package:date_picker_timeline/date_picker_timeline.dart';
import 'package:flutter/material.dart';
import 'package:todo/screens/taskItem.dart';
import 'package:todo/screens/taskItem_screen.dart';
class TaskTab extends StatelessWidget {
  const TaskTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 120,
          child: Stack(
            children: [
              Container(
                height: 70,
                color: Colors.blueGrey,
              ),
              DatePicker(
                DateTime.now(),
                daysCount: 365,
                height: MediaQuery.of(context).size.height * 0.15,
                initialSelectedDate: DateTime.now(),
                // initialSelectedDate: DateTime.now().add(Duration(days: 2)),
                selectionColor: Colors.blueGrey,
                selectedTextColor: Colors.white,
                deactivatedColor: Colors.grey,
                unseletionColor: Color(0xB9CCB095),
                // inactiveDates: [
                //   DateTime.now().add(Duration(days: 2))
                // ],
                locale: "en",
                onDateChange: (date) {
                  // New date selected
                  // setState(() {
                  //   _selectedValue = date;
                  // });
                },
              ),
            ],
          ),
        ),
        Expanded(
          child: ListView.builder(itemBuilder: (context, index) {
            return TaskItemScreen();
          },
          itemCount: 9,),
        )
      ],
    );
  }
}
