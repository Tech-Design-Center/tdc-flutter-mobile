import 'dart:convert';

List<Popular> popularListFromJson(String val) => List<Popular>.from(
    json.decode(val)['data'].map((popular) => Popular.fromJson(popular)));

class Popular {
  final int id;
  final String image;
  final String title;
  final String author;
  final String description;
  final String about;
  final int duration;
  final int price;
  final String videoTrailerId;
  final bool isEnroll;

  Popular({
    required this.id,
    required this.image,
    required this.title,
    required this.author,
    required this.description,
    required this.about,
    required this.duration,
    required this.price,
    required this.videoTrailerId,
    required this.isEnroll,
  });

  factory Popular.fromJson(Map<String, dynamic> data) => Popular(
        id: data['attributes']['course']['data']['id'],
        image: data['attributes']['course']['data']['attributes']['image']
            ['data']['attributes']['url'],
        title: data['attributes']['course']['data']['attributes']['title'],
        author: data['attributes']['course']['data']['attributes']['author'],
        description: data['attributes']['course']['data']['attributes']
            ['description'],
        about: data['attributes']['course']['data']['attributes']['about'],
        duration: data['attributes']['course']['data']['attributes']
            ['duration'],
        price: data['attributes']['course']['data']['attributes']['price'],
        videoTrailerId: data['attributes']['course']['data']['attributes']
            ['videoTrailerURL'],
        isEnroll: data['attributes']['course']['data']['attributes']
            ['isEnroll'],
      );
}
