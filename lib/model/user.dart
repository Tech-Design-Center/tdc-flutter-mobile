import 'dart:convert';

User userFromJson(String str) => User.fromJson(json.decode(str));

class User {
  String id;
  String fullName;
  String email;
  int phoneNumber;
  String? image;
  DateTime? birthDay;
  String surname;
  String name;

  User({
    required this.id,
    required this.fullName,
    required this.email,
    required this.phoneNumber,
    required this.image,
    required this.birthDay,
    required this.surname,
    required this.name,
  });

  factory User.fromJson(Map<dynamic, dynamic> data) => User(
        id: data['id'].toString(),
        fullName: data['fullName'],
        email: data['email'],
        phoneNumber: data['phoneNumber'],
        image: data['image'] == null ? null : data['image']['url'],
        birthDay: data['age'] == null ? null : DateTime.parse(data['age']),
        surname: data['surname'],
        name: data['name'],

      );
}
