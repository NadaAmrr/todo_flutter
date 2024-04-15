import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:todo_app/models/task_model.dart';

class FirebaseFunctions {
  static CollectionReference<TaskModel> getTasksCollection () {
   return FirebaseFirestore.instance.collection("Tasks").withConverter<TaskModel>(
        fromFirestore: (snapshot, _) {
          return TaskModel.fromJson(snapshot.data()!);
        }, toFirestore: (value, _) {
      return value.toJson();
    });
  }
  /// Add
  static Future<void> addTask(TaskModel model) async {
      var collection = getTasksCollection();
      var docRef = collection.doc();
      model.id = docRef.id;
      return await docRef.set(model);
  }
  /// Get one time
  static Future<QuerySnapshot<TaskModel>> getOneTimeTask() {
    var collection = getTasksCollection();
    return collection.get();
  }
  /// Get real time
  static Stream<QuerySnapshot<TaskModel>> getRealTimeTask(DateTime date) {
    var collection = getTasksCollection()
        .where("date",isEqualTo: DateUtils.dateOnly(date).millisecondsSinceEpoch)
        .snapshots();
    return collection;
  }
  /// Edit
  static void editTask(String id) {

  }
  /// Delete
  static Future<void> deleteTask(String id) {
    return getTasksCollection().doc(id).delete();
  }
}
