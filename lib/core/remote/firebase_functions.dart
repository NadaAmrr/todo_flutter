import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:todo_app/models/task_model.dart';
import 'package:todo_app/models/user_model.dart';

class FirebaseFunctions {
  /// Get tasks collection
  static CollectionReference<TaskModel> getTasksCollection() {
    return FirebaseFirestore.instance
        .collection("Tasks")
        .withConverter<TaskModel>(fromFirestore: (snapshot, _) {
      return TaskModel.fromJson(snapshot.data()!);
    }, toFirestore: (value, _) {
      return value.toJson();
    });
  }

  /// Get Users collection
  static CollectionReference<UserModel> getUsersCollection() {
    return FirebaseFirestore.instance
        .collection("Users")
        .withConverter<UserModel>(fromFirestore: (snapshot, _) {
      return UserModel.fromJson(snapshot.data()!);
    }, toFirestore: (value, _) {
      return value.toJson();
    });
  }

  /// Add User
  static Future<void> addUser(UserModel model) async {
    var collection = getUsersCollection();
    var docRef = collection.doc(model.id);
    return await docRef.set(model);
  }

  /// Get one User
  static Future<UserModel?> readUser() async {
    String id = FirebaseAuth.instance.currentUser!.uid;
    var collection = getUsersCollection();
    DocumentSnapshot<UserModel> snap = await collection.doc(id).get();
    return snap.data();
  }

  /// Add task
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
    .where("userId", isEqualTo: FirebaseAuth.instance.currentUser!.uid)
        .where("date",
        isEqualTo: DateUtils.dateOnly(date).millisecondsSinceEpoch)
        .snapshots();
    return collection;
  }

  /// Edit
  static void editTask(String id) {}

  /// Delete
  static Future<void> deleteTask(String id) {
    return getTasksCollection().doc(id).delete();
  }

  /// Auth - signup
  static createAccount(
      {required String email,
        required String username,
        required String password,
        required Function onSuccess,
        required Function onError}) async {
    try {
      final credential =
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      // credential.user!.sendEmailVerification();
      UserModel model = UserModel(
          email: email,
          username: username,
          id: credential.user!.uid
      );
      addUser(model);
      onSuccess();
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        onError('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        onError('The account already exists for that email.');
      }
      onError(e.message);
    } catch (e) {
      onError(e.toString());
    }
  }

  /// Auth - login
  static login(
      {email,
        password,
        required Function onSuccess,
        required Function onError}) async {
    try {
      final credential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      // if (credential.user!.emailVerified) {
      // onSuccess();
      // } else {
      // onError("Please, verify your account");
      // }
      onSuccess();
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        onError('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        onError('Wrong password provided for that user.');
      }
      onError(e.message);
    } catch (e) {
      onError(e.toString());
    }
  }
}
