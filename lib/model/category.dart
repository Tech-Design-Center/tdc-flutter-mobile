import 'dart:convert';

List<Category> categoryListFromJson(String val) => List<Category>.from(
    json.decode(val)['data'].map((category) => Category.categoryFromJson(category)));

class Category {
  final int id;
  final String name;
  final String image;
  final List<String> title;
  final List<String> documentURL;
  final List<String> examURL;
  final List<String> telegramURL;

  final List<String> description;
  final List<String> author;
  final List<int> duration;
  final List<int> price;
  final List<String> imageCourse;
  final List<String> videoTrailerURL;
  final List<String> ABAPaymentURL;

  final List<List<String>> playlistTitle;
  final List<List<List<String>>> videoTitle;
  final List<List<List<String>>> videoUrl;
  Category({
    required this.id,
    required this.name,
    required this.documentURL,
    required this.examURL,
    required this.telegramURL,
    required this.image,
    required this.title,
    required this.description,
    required this.author,
    required this.duration,
    required this.price,
    required this.imageCourse,
    required this.videoTrailerURL,
    required this.ABAPaymentURL,
    required this.playlistTitle,
    required this.videoTitle,
    required this.videoUrl,
  });

  factory Category.categoryFromJson(Map<String, dynamic> data) {
    return Category(
      id: data['id'],
      name: data['attributes']['name'] ?? 'Not Yet',
      image: data['attributes']['image']['data']['attributes']['url'] ?? 'Not Yet',
      title: List<String>.from(
          data['attributes']['courses']['data'].map((title) => title['attributes']['title'])?? 'Not Yet'),
      documentURL: List<String>.from(
          data['attributes']['courses']['data'].map((title) => title['attributes']['documentURL'])?? 'Not Yet'),
      examURL: List<String>.from(
          data['attributes']['courses']['data'].map((title) => title['attributes']['examURL'])?? 'Not Yet'),
      telegramURL: List<String>.from(
          data['attributes']['courses']['data'].map((title) => title['attributes']['telegramURL'])?? 'Not Yet'),
      description: List<String>.from(data['attributes']['courses']['data']
          .map((description) => description['attributes']['description'])?? 'Not Yet'),
      author: List<String>.from(
          data['attributes']['courses']['data'].map((author) => author['attributes']['author'])?? 'Not Yet'),
      duration: List<int>.from(data['attributes']['courses']['data']
          .map((duration) => duration['attributes']['duration'])?? 'Not Yet'),
      price: List<int>.from(
          data['attributes']['courses']['data'].map((price) => price['attributes']['price'])?? 'Not Yet'),
      imageCourse: List<String>.from(data['attributes']['courses']['data']
          .map((imageCourse) => imageCourse['attributes']['image']['data']['attributes']['url'])?? 'Not Yet'),
      videoTrailerURL: List<String>.from(data['attributes']['courses']['data']
          .map((videoTrailerURL) => videoTrailerURL['attributes']['videoTrailerURL'])?? 'Not Yet'),
      ABAPaymentURL: List<String>.from(
          data['attributes']['courses']['data'].map((data) => data['attributes']['ABAPaymentURL'])?? 'Not Yet'),
      playlistTitle: List<List<String>>.from(data['attributes']['courses']['data'].map((data) =>
          List<String>.from(data['attributes']['playlist_video_urls']['data']
              .map((data) => data['attributes']['title'])))?? 'Not Yet'),
      videoTitle: List<List<List<String>>>.from(data['attributes']['courses']['data'].map((data) =>
          List<List<String>>.from(data['attributes']['playlist_video_urls']['data'].map((data) =>
              List<String>.from(data['attributes']['video_urls']['data']
                  .map((data) => data['attributes']['title'])))))?? 'Not Yet'),
      videoUrl: List<List<List<String>>>.from(data['attributes']['courses']['data'].map((data) =>
          List<List<String>>.from(data['attributes']['playlist_video_urls']['data'].map((data) =>
              List<String>.from(data['attributes']['video_urls']['data']
                  .map((data) => data['attributes']['videoURL'])))))?? 'Not Yet'),
    );
  }
}
