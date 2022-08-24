import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:todo_app/database/task.dart';

class MyDatabase {
  static CollectionReference<Task> getTasksCollection() {
    return FirebaseFirestore.instance
        .collection(Task.collectionName)
        .withConverter<Task>(fromFirestore: (snapshot, options) {
      return Task.fromFireStore(snapshot.data()!);

      // we get data from firestore which is in (snapshot.data) we pass it to our fromfirestore func in Task class
    }, toFirestore: (task, options) {
      return task.toFireStore();
      // our scoop now is just object from class Task (which is task)
      // what we do is select our object we want to send then call fun tofirestore
    });
  }

  static void insertTask(Task task) {
    var tasksCollection = getTasksCollection();
    var taskdoc = tasksCollection
        .doc(); // we created new doc named taskdoc in the collection
    task.id = taskdoc.id; // we toke id of the doc created into id of class task
    taskdoc.set(task); // add object data to the created doc with set func
  }
}
