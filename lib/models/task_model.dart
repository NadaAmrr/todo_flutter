class TaskModel {
  String id;
  String title;
  String details;
  bool isDone;
  int date;

  TaskModel(
      {this.id = "",
      required this.title,
      required this.details,
      this.isDone = false,
      required this.date});

  /// Map => Model - Named constructor
  TaskModel.fromJson(Map<String, dynamic> json)
      : this(
            title: json['title'],
            details: json['details'],
            date: json['date'],
            isDone: json['isDone'],
            id: json['id']);

  /// Model => Map
  Map<String, dynamic> toJson() {
    return {
      "title": title,
      "details": details,
      "date": date,
      "isDone": isDone,
      "id": id,
    };
  }
}
