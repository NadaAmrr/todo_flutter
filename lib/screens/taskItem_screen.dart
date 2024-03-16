import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:todo/models/task_model.dart';

class TaskItemScreen extends StatelessWidget {
  TaskModel model;
  TaskItemScreen({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent,
      margin: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width * 0.05,
          vertical: MediaQuery.of(context).size.height * 0.006),
      child: Slidable(
        startActionPane:
            ActionPane(motion: DrawerMotion(), extentRatio: .5, children: [
          SlidableAction(
            onPressed: (context) {},
            backgroundColor: Colors.red,
            icon: Icons.delete,
            label: "Delete",
            borderRadius: BorderRadius.horizontal(left: Radius.circular(23)),
          ),
          SlidableAction(
              onPressed: (context) {},
              backgroundColor: Colors.blue,
              icon: Icons.edit,
              label: "Edit"),
        ]),
        child: Container(
          // height: MediaQuery.of(context).size.height * 0.15,
          padding: EdgeInsets.all(18),
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(
              color: Colors.blueGrey,
              width: 2,
            ),
            borderRadius: BorderRadius.horizontal(right: Radius.circular(20))
          ),
          child: ListTile(
            minLeadingWidth: 0,
            contentPadding: EdgeInsets.only(bottom: 0),
            leading: Container(
              height: double.infinity,
              width: 6,
              decoration: BoxDecoration(
                  color: Colors.blueGrey,
                  borderRadius: BorderRadius.circular(25)),
            ),
            title: Text(model.title),
            subtitle: Text(model.description),
            trailing: Container(
              padding: EdgeInsets.symmetric(horizontal: 12),
              decoration: BoxDecoration(
                color: Colors.blueGrey,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Icon(
                Icons.done,
                size: 30,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
