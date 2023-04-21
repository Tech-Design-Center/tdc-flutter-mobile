import 'dart:convert';

List<Course> courseListFromJson(String val) =>
    List<Course>.from(json.decode(val).map((data) => Course.fromJson(data)));

class Course {
  final String? email;
  final List<String>? image;
  final List<String>? title;
  final List<String>? author;
  final List<String>? description;
  final List<String>? about;
  final List<int>? duration;
  final List<int>? price;
  final List<String>? videoTrailerURL;
  final List<String>? ABAPaymentURL;

  final List<List<String>>? playlistTitle;
  final List<List<List<String>>>? videoTitle;
  final List<List<List<String>>>? videoUrl;

  Course({
    required this.email,
    required this.image,
    required this.title,
    required this.author,
    required this.description,
    required this.about,
    required this.duration,
    required this.price,
    required this.videoTrailerURL,
    required this.ABAPaymentURL,
    required this.playlistTitle,
    required this.videoTitle,
    required this.videoUrl,
  });

  factory Course.fromJson(Map<String, dynamic> data) {
    return Course(
      email: data['email'],
      about: List<String>.from(data['courses'].map((data) => data['about'])),
      image: List<String>.from(data['courses'].map((data) => data['image']['url'])),
      title: List<String>.from(data['courses'].map((data) => data['title'])),
      author: List<String>.from(data['courses'].map((data) => data['author'])),
      description: List<String>.from(data['courses'].map((data) => data['description'])),
      duration: List<int>.from(data['courses'].map((data) => data['duration'])),
      price: List<int>.from(data['courses'].map((data) => data['price'])),
      videoTrailerURL: List<String>.from(data['courses'].map((data) => data['videoTrailerURL'])),
      ABAPaymentURL: List<String>.from(data['courses'].map((data) => data['ABAPaymentURL'])),
      playlistTitle: List<List<String>>.from(data['courses'].map(
          (data) => List<String>.from(data['playlist_video_urls'].map((data) => data['title'])))),
      videoTitle: List<List<List<String>>>.from(data['courses'].map((data) =>
          List<List<String>>.from(data['playlist_video_urls']
              .map((data) => List<String>.from(data['video_urls'].map((data) => data['title'])))))),
      videoUrl: List<List<List<String>>>.from(data['courses'].map((data) => List<List<String>>.from(
          data['playlist_video_urls'].map(
              (data) => List<String>.from(data['video_urls'].map((data) => data['videoURL'])))))),
    );
  }
}
