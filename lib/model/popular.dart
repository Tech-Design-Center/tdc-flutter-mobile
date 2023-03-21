import 'dart:convert';

List<Popular> popularListFromJson(String val) => List<Popular>.from(
    json.decode(val)['data'].map((popular) => Popular.fromJson(popular)));

class Popular {
  final List<int> id;
  final List<String> image;
  final List<String> title;
  final List<String> author;

  Popular(
      {required this.id,
      required this.image,
      required this.title,
      required this.author});

  factory Popular.fromJson(Map<String, dynamic> data) => Popular(
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
