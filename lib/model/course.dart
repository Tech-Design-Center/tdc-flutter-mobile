import 'dart:convert';

List<Course> courseListFromJson(String val) =>
    List<Course>.from(json.decode(val)['data'].map((data) => Course.fromJson(data)));

class Course {
  final int id;
  final String image;
  final String title;
  final String author;
  final String description;
  final String about;
  final int duration;
  final int price;
  final String videoTrailerURL;
  final bool isEnroll;
  final List<String> playlistTitle;
  final List<List<String>> videoTitle;
  final List<List<String>> videoUrl;

  Course({
    required this.id,
    required this.image,
    required this.title,
    required this.author,
    required this.description,
    required this.about,
    required this.duration,
    required this.price,
    required this.videoTrailerURL,
    required this.isEnroll,
    required this.playlistTitle,
    required this.videoTitle,
    required this.videoUrl,
  });

  factory Course.fromJson(Map<String, dynamic> data) {
    final videoTitleList = List<List<String>>.from(data['attributes']['playlist_video_urls']['data']
            .map((e) => List<String>.from(
                e['attributes']['video_urls']['data'].map((e) => (e['attributes']['title'])))))
        .toList();
    final videoUrlList = List<List<String>>.from(data['attributes']['playlist_video_urls']['data']
            .map((e) => List<String>.from(
                e['attributes']['video_urls']['data'].map((e) => (e['attributes']['videoURL'])))))
        .toList();
    return Course(
      id: data['id'],
      image: data['attributes']['image']['data']['attributes']['url'],
      title: data['attributes']['title'],
      author: data['attributes']['author'],
      description: data['attributes']['description'],
      about: data['attributes']['about'],
      duration: data['attributes']['duration'],
      price: data['attributes']['price'],
      videoTrailerURL: data['attributes']['videoTrailerURL'],
      isEnroll: data['attributes']['isEnroll'],
      playlistTitle: List<String>.from(data['attributes']['playlist_video_urls']['data']
          .map((data) => data['attributes']['title'])),
      videoTitle: videoTitleList,
      videoUrl: videoUrlList,
    );
  }
}
