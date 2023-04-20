import 'dart:convert';

List<Notifications> notificationListFromJson(String val) => List<Notifications>.from(
    json.decode(val)['data'].map((newsFeed) => Notifications.fromJson(newsFeed)));

class Notifications {
  final int? id;
  final String? image;
  final String? title;
  final String? description;
  final String? poster;
  final DateTime? publishedAt;

  Notifications({
    required this.id,
    required this.image,
    required this.title,
    required this.description,
    required this.poster,
    required this.publishedAt,
  });

  factory Notifications.fromJson(Map<String, dynamic> data) => Notifications(
        id: data['id'],
        image: data['attributes']['image']['data']['attributes']['url'],
        title: data['attributes']['title'],
        description: data['attributes']['description'],
        poster: data['attributes']['poster']['data']['attributes']['url'],
        publishedAt: DateTime.parse(data['attributes']['publishedAt'].toString()),
      );
}
