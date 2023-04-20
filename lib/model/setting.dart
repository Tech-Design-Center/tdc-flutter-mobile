import 'dart:convert';

List<Setting> settingListFromJson(String val) =>
    List<Setting>.from(json.decode(val)['data'].map((setting) => Setting.fromJson(setting)));

class Setting {
  final int? id;
  final String? image;
  final String? fullName;

  Setting({required this.id, required this.image, required this.fullName});

  factory Setting.fromJson(Map<String, dynamic> data) =>
      Setting(id: data['id'], image: data['image']['url'], fullName: data['fullName']);
}
