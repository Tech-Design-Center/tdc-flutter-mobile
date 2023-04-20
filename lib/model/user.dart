import 'dart:convert';

User userFromJson(String str) => User.fromJson(json.decode(str));

class User {
  String? id;
  String? fullName;
  String? email;
  int? phoneNumber;
  DateTime? birthDay;
  String? surname;
  String? name;
  String? address;
  String? imageURL;

  User({
    required this.id,
    required this.fullName,
    required this.email,
    required this.phoneNumber,
    required this.birthDay,
    required this.surname,
    required this.name,
    required this.address,
    required this.imageURL,
  });

  factory User.fromJson(Map<dynamic, dynamic> data) => User(
        id: data['id'].toString(),
        fullName: data['fullName'],
        email: data['email'],
        phoneNumber: data['phoneNumber'],
        birthDay: data['age'] == null ? null : DateTime.parse(data['age']),
        surname: data['surName'],
        name: data['name'],
        address: data['address'],
        imageURL: data['imageURL'] ??
            'https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_1280.png',
      );
}
