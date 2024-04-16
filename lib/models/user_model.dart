
class UserModel {
  String? id;
  String? username;
  String? email;

  UserModel({this.id, this.username, this.email});

  /// Map => Model - Named constructor
  UserModel.fromJson(Map<String, dynamic> json)
      : this(
    id: json['id'],
    email: json['email'],
    username: json['username'],
  );

  /// Model => Map
  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "email": email,
      "username": username
    };
  }}