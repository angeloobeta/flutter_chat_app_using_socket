class UserModel {
  String? email;
  int? id;
  String? name;

  UserModel({this.email, this.id, this.name});

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
        id: map['id'] as int,
        email: map['email'] as String,
        name: map['name'] as String);
  }

  Map<String, dynamic> toMap() => {"id": id, "email": email, "name": name};
}
