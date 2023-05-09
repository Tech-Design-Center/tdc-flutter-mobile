import 'dart:convert';

List<NewsFeed> newsFeedListFromJson(String val) =>
    List<NewsFeed>.from(json.decode(val)['data'].map((newsFeed) => NewsFeed.fromJson(newsFeed)));

class NewsFeed {
  final int id;
  final String image;
  final String title;
  final String description;
  final String poster;
  final DateTime publishedAt;

  NewsFeed({
    required this.id,
    required this.image,
    required this.title,
    required this.description,
    required this.poster,
    required this.publishedAt,
  });

  factory NewsFeed.fromJson(Map<String, dynamic> data) => NewsFeed(
        id: data['id'],
        image: data['attributes']['image']['data']['attributes']['url'] ?? 'Not Yet',
        title: data['attributes']['title'] ?? 'Not Yet',
        description: data['attributes']['description'] ?? 'Not Yet',
        poster: data['attributes']['poster']['data']['attributes']['url'] ?? 'Not Yet',
        publishedAt: DateTime.parse(data['attributes']['publishedAt'].toString() ?? 'Not Yet'),
      );
}
