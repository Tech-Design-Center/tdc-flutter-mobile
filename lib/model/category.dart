import 'dart:convert';

List<Category> categoryListFromJson(String val) => List<Category>.from(
    json.decode(val)['data'].map((category) => Category.categoryFromJson(category)));

class Category {
  final int id;
  final String name;
  final String image;
  final List<String> title;
  final List<String> description;
  final List<String> author;
  final List<String> about;
  final List<int> duration;
  final List<int> price;
  final List<String> imageCourse;
  final List<String> videoTrailerURL;
  final List<List<String>> playlistTitle;
  final List<List<List<String>>> videoTitle;
  final List<List<List<String>>> videoUrl;
  Category({
    required this.id,
    required this.name,
    required this.image,
    required this.title,
    required this.description,
    required this.author,
    required this.about,
    required this.duration,
    required this.price,
    required this.imageCourse,
    required this.videoTrailerURL,
    required this.playlistTitle,
    required this.videoTitle,
    required this.videoUrl,
  });

  factory Category.categoryFromJson(Map<String, dynamic> data) {
    return Category(
      id: data['id'],
      name: data['attributes']['name'],
      image: data['attributes']['image']['data']['attributes']['url'],
      title: List<String>.from(
          data['attributes']['courses']['data'].map((title) => title['attributes']['title'])),
      description: List<String>.from(data['attributes']['courses']['data']
          .map((description) => description['attributes']['description'])),
      author: List<String>.from(
          data['attributes']['courses']['data'].map((author) => author['attributes']['author'])),
      about: List<String>.from(
          data['attributes']['courses']['data'].map((about) => about['attributes']['about'])),
      duration: List<int>.from(data['attributes']['courses']['data']
          .map((duration) => duration['attributes']['duration'])),
      price: List<int>.from(
          data['attributes']['courses']['data'].map((price) => price['attributes']['price'])),
      imageCourse: List<String>.from(data['attributes']['courses']['data']
          .map((imageCourse) => imageCourse['attributes']['image']['data']['attributes']['url'])),
      videoTrailerURL: List<String>.from(data['attributes']['courses']['data']
          .map((videoTrailerURL) => videoTrailerURL['attributes']['videoTrailerURL'])),
      playlistTitle: List<List<String>>.from(data['attributes']['courses']['data'].map((data) =>
          List<String>.from(data['attributes']['playlist_video_urls']['data']
              .map((data) => data['attributes']['title'])))),
      videoTitle: List<List<List<String>>>.from(data['attributes']['courses']['data'].map((data) =>
          List<List<String>>.from(data['attributes']['playlist_video_urls']['data'].map((data) =>
              List<String>.from(data['attributes']['video_urls']['data']
                  .map((data) => data['attributes']['title'])))))),
      videoUrl: List<List<List<String>>>.from(data['attributes']['courses']['data'].map((data) =>
          List<List<String>>.from(data['attributes']['playlist_video_urls']['data'].map((data) =>
              List<String>.from(data['attributes']['video_urls']['data']
                  .map((data) => data['attributes']['videoURL'])))))),
    );
  }
}
