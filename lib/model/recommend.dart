import 'dart:convert';

List<Recommend> recommendListFromJson(String val) => List<Recommend>.from(
    json.decode(val)['data'].map((recommend) => Recommend.fromJson(recommend)));

class Recommend {
  final int id;
  final String image;
  final String title;
  final String author;

  Recommend(
      {required this.id,
      required this.image,
      required this.title,
      required this.author});

  factory Recommend.fromJson(Map<String, dynamic> data) => Recommend(
      id: data['id'],
      title: data['attributes']['course']['data']['attributes']['title'],
      author: data['attributes']['course']['data']['attributes']['author'],
      image: data['attributes']['course']['data']['attributes']['image']['data']
          ['attributes']['url']);
}
