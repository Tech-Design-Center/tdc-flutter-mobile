import 'dart:convert';

List<Notifications> notificationListFromJson(String val) =>
    List<Notifications>.from(json.decode(val)['data'].map((data) => Notifications.fromJson(data)));

class Notifications {
  final int? id;
  final String? title;
  final String? description;
  final DateTime? publishedAt;

  Notifications({
    required this.id,
    required this.title,
    required this.description,
    required this.publishedAt,
  });

  factory Notifications.fromJson(Map<String, dynamic> data) => Notifications(
        id: data['id'],
        title: data['attributes']['title'],
        description: data['attributes']['description'],
        publishedAt: DateTime.parse(data['attributes']['publishedAt'].toString()),
      );
}
