import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:todo_app/database/task.dart';
import 'package:todo_app/date_utils.dart';

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

  static Future<void> insertTask(Task task) {
    var tasksCollection = getTasksCollection();
    var taskdoc = tasksCollection
        .doc(); // we created new doc named taskdoc in the collection
    task.id = taskdoc.id; // we toke id of the doc created into id of class task
    return taskdoc
        .set(task); // add object data to the created doc with set func
  }

  static Stream<QuerySnapshot<Task>> listenForTasksRealTimeUpdates(
      DateTime selectedDate) {
    return getTasksCollection()
        .where('dateTime',
            isEqualTo: dateOnly(selectedDate).millisecondsSinceEpoch)
        .snapshots();
    //.get() bring all tasks(docs) in tasks collection
    // so querySnapshot carry all docs

    //List<Task> tasks= querySnapshot.docs.map((elemnt) => elemnt.data()).toList();    //we changed that we do it there where we use the func

    // querySnapshot.docs => carry specific doc
    //querySnapshot.docs => return QueryDocumentSnapshot<Task>
    // docs.map => convert the QueryDocumentSnapshot<Task> to List<Task>
  }

  static Future<QuerySnapshot<Task>> getAllTasks(DateTime selectedDate) async {
    return await getTasksCollection()
        .where('dateTime',
            isEqualTo: dateOnly(selectedDate).millisecondsSinceEpoch)
        .get();
    //.get() bring all tasks(docs) in tasks collection
    // so querySnapshot carry all docs

    //List<Task> tasks= querySnapshot.docs.map((elemnt) => elemnt.data()).toList();    //we changed that we do it there where we use the func

    // querySnapshot.docs => carry specific doc
    //querySnapshot.docs => return QueryDocumentSnapshot<Task>
    // docs.map => convert the QueryDocumentSnapshot<Task> to List<Task>
  }

  static Future<void> deleteTask(Task task) {
    var taskToBeDeleted = getTasksCollection().doc(task.id);
    return taskToBeDeleted.delete();
  }

  static void EditIsDone(Task task) {
    CollectionReference taskRef = getTasksCollection();
    taskRef.doc(task.id).update({"isDone": task.isDone! ? false : true});
  }

  static EditTaskDetails(Task task) {
    CollectionReference taskRef = getTasksCollection();
    return taskRef.doc(task.id).update({
      'title': task.title,
      'descrebtion': task.descrebtion,
      'dateTime': dateOnly(task.dateTime!).millisecondsSinceEpoch
    });
  }
}
