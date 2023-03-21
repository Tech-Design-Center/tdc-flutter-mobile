import 'dart:convert';

List<Recommend> recommendListFromJson(String val) => List<Recommend>.from(
    json.decode(val)['data'].map((recommend) => Recommend.fromJson(recommend)));

class Recommend {
  final List<int> id;
  final List<String> image;
  final List<String> title;
  final List<String> author;

  Recommend(
      {required this.id,
      required this.image,
      required this.title,
      required this.author});

  factory Recommend.fromJson(Map<String, dynamic> data) => Recommend(
      id: List<int>.from(
          data['attributes']['courses']['data'].map((id) => id['id'])),
      title: List<String>.from(data['attributes']['courses']['data']
          .map((title) => title['attributes']['title'])),
      author: List<String>.from(data['attributes']['courses']['data']
          .map((author) => author['attributes']['author'])),
      image: List<String>.from(data['attributes']['courses']['data'].map(
          (image) =>
              image['attributes']['image']['data']['attributes']['url'])));
}
