import 'dart:convert';

List<Popular> popularListFromJson(String val) => List<Popular>.from(
    json.decode(val)['data'].map((recommend) => Popular.fromJson(recommend)));

class Popular {
  final int id;
  final String image;
  final String title;
  final String author;

  Popular(
      {required this.id,
      required this.image,
      required this.title,
      required this.author});

  factory Popular.fromJson(Map<String, dynamic> data) => Popular(
      id: data['id'],
      title: data['attributes']['course']['data']['attributes']['title'],
      author: data['attributes']['course']['data']['attributes']['author'],
      image: data['attributes']['course']['data']['attributes']['image']['data']
          ['attributes']['url']);
}
