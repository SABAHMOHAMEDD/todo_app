class Task {
  static const String collectionName = 'tasks';
  String? id;
  String? title;
  String? descrebtion;
  DateTime? dateTime;
  bool? isDone;

  Task({this.id, this.title, this.descrebtion, this.dateTime, this.isDone});

  Task.fromFireStore(Map<String, dynamic> data)
      : this(
            id: data['id'],
            title: data['title'],
            descrebtion: data['descrebtion'],
            dateTime: DateTime.fromMillisecondsSinceEpoch((data['dateTime'])),
            isDone: data['isDone']);

  Map<String, dynamic> toFireStore() {
    return {
      'id': id,
      'title': title,
      'descrebtion': descrebtion,
      'dateTime': dateTime!.millisecondsSinceEpoch,

      //'dateTime':   FieldValue.serverTimestamp()
      'isDone': isDone
    };
  }
}
