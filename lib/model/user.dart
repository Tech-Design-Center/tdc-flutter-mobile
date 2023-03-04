import 'dart:convert';

User userFromJson(String str) => User.fromJson(json.decode(str));

class User {
  String id;
  String fullName;
  String email;
  int phoneNumber;
  String? image;
  DateTime? birthDay;

  User(
      {required this.id,
      required this.fullName,
      required this.email,
      required this.phoneNumber,
      this.image,
      this.birthDay});

  factory User.fromJson(Map<String, dynamic> data) => User(
        id: data['id'].toString(),
        fullName: data['fullName'],
        email: data['email'],
        phoneNumber: data['phoneNumber'],
        image: data['image']['url'],
        birthDay: data['age'] == null ? null : DateTime.parse(data['age']),
      );
}
