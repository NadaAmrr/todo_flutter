class TaskModel {
  String id;
  String title;
  String description;
  bool isDone;
  int date;

  TaskModel(
      {this.id = "",
      required this.title,
      required this.description,
      required this.date,
      this.isDone = false});

  // TaskModel fromJson(Map<String, dynamic> json) {
  //   return TaskModel(
  //       id: json['id'],
  //       title: json['title'],
  //       description: json['description'],
  //       date: json['date'],
  //       isDone: json['isDone']);
  // }

  TaskModel.fromJson(Map<String, dynamic> json): this(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      date: json['date'],
      isDone: json['isDone']
  );

  Map<String, dynamic> toJson() {
    return {
      "description": description,
      "title": title,
      "id": id,
      "isDone": isDone,
      "date": date
    };
  }
}
