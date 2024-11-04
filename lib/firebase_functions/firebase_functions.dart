import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:to_do_app/models/task_models.dart';

import '../models/usermodal.dart';

class FirebaseFunctions {
  static CollectionReference<UserModel> getUserCollection() =>
      FirebaseFirestore.instance.collection('User').withConverter<UserModel>(
          fromFirestore: (snapshot, _) => UserModel.fromJson(snapshot.data()!),
          toFirestore: (UserModel, _) => UserModel.toJson());

  // getter for the collection of tasks and the way data to and from collection should be treated
  static CollectionReference<TaskModel> getTasksCollection() =>
      FirebaseFirestore.instance.collection('tasks').withConverter<TaskModel>(
          fromFirestore: (snapshot, _) => TaskModel.fromJson(snapshot.data()!),
          toFirestore: (taskModel, _) => taskModel.toJson());

  static Future<void> addTaskToFireBase(TaskModel task) {
    CollectionReference taskCollection = getTasksCollection();
    DocumentReference dc = taskCollection.doc(); //auto generated id
    task.id = dc.id;
    return dc.set(task);
  }

  static Future<List<TaskModel>> getAllTasks() async {
    CollectionReference<TaskModel> taskCollection = getTasksCollection();
    QuerySnapshot<TaskModel?> queryDocumentSnapshot =
        await taskCollection.get();
    return queryDocumentSnapshot.docs
        .map((queryDocumentSnapshot) => queryDocumentSnapshot.data()!)
        .toList();
  }

  static Future<void> deleteTasks(String taskId) async {
    CollectionReference<TaskModel> taskCollection = getTasksCollection();
    return taskCollection.doc(taskId).delete();
  }

  static Future<UserModel> register(
      {required String name,
      required String email,
      required String password}) async {
    UserCredential credential = await FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email, password: password);
    UserModel user =
        UserModel(id: credential.user!.uid, name: name, email: email);
    CollectionReference<UserModel> userCollection = getUserCollection();
    await userCollection.doc(credential.user!.uid).set(user);
    return user;
  }
  static Future<void> logout() => FirebaseAuth.instance.signOut();
  static Future<UserModel> login(
      {required String email, required String password}) async {
    UserCredential credential = await FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email, password: password);
    CollectionReference<UserModel> userCollection = getUserCollection();
    userCollection.doc(credential.user!.uid);
    DocumentSnapshot<UserModel> documentSnapshot =
        await userCollection.doc(credential.user!.uid).get();
    return documentSnapshot.data()!;
  }


}
// crud principles
/*
* create
* read
* update
* delete
* */
