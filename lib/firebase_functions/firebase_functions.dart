import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:to_do_app/models/task_models.dart';

class FirebaseFunctions {
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

  static Future <List<TaskModel>> getAllTasks() async {
    CollectionReference<TaskModel> taskCollection = getTasksCollection();
    QuerySnapshot<TaskModel?> queryDocumentSnapshot =
        await taskCollection.get();
    return queryDocumentSnapshot.docs.map((queryDocumentSnapshot) => queryDocumentSnapshot.data()!).toList();
  }
}
// crud principles
/*
* create
* read
* update
* delete
* */
