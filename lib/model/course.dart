import 'dart:convert';

List<Course> courseListFromJson(String val) =>
    List<Course>.from(json.decode(val).map((data) => Course.fromJson(data)));

class Course {
  final String? email;
  final List<DateTime>? purchaseDate;
  final List<String>? image;
  final List<String>? documentURL;
  final List<String>? examURL;
  final List<String>? telegramURL;
  final List<String>? title;
  final List<String>? author;
  final List<String>? description;
  final List<int>? duration;
  final List<int>? price;
  final List<String>? videoTrailerURL;
  final List<String>? ABAPaymentURL;
  final List<List<String>>? playlistTitle;
  final List<List<List<String>>>? videoTitle;
  final List<List<List<String>>>? videoUrl;

  Course({
    required this.email,
    required this.documentURL,
    required this.examURL,
    required this.telegramURL,
    required this.purchaseDate,
    required this.image,
    required this.title,
    required this.author,
    required this.description,
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
      purchaseDate: List<DateTime>.from(
          data['course_user_links'].map((data) => DateTime.parse(data['publishedAt'].toString()))),
      documentURL:
          List<String>.from(data['course_user_links'].map((data) => data['course']['documentURL'])),
      examURL:
          List<String>.from(data['course_user_links'].map((data) => data['course']['examURL'])),
      telegramURL:
          List<String>.from(data['course_user_links'].map((data) => data['course']['telegramURL'])),
      image: List<String>.from(
          data['course_user_links'].map((data) => data['course']['image']['url'])),
      title: List<String>.from(data['course_user_links'].map((data) => data['course']['title'])),
      author: List<String>.from(data['course_user_links'].map((data) => data['course']['author'])),
      description:
          List<String>.from(data['course_user_links'].map((data) => data['course']['description'])),
      duration: List<int>.from(data['course_user_links'].map((data) => data['course']['duration'])),
      price: List<int>.from(data['course_user_links'].map((data) => data['course']['price'])),
      videoTrailerURL: List<String>.from(
          data['course_user_links'].map((data) => data['course']['videoTrailerURL'])),
      ABAPaymentURL: List<String>.from(
          data['course_user_links'].map((data) => data['course']['ABAPaymentURL'])),
      playlistTitle: List<List<String>>.from(data['course_user_links'].map((data) =>
          List<String>.from(data['course']['playlist_video_urls'].map((data) => data['title'])))),
      videoTitle: List<List<List<String>>>.from(data['course_user_links'].map((data) =>
          List<List<String>>.from(data['course']['playlist_video_urls']
              .map((data) => List<String>.from(data['video_urls'].map((data) => data['title'])))))),
      videoUrl: List<List<List<String>>>.from(data['course_user_links'].map((data) =>
          List<List<String>>.from(data['course']['playlist_video_urls'].map(
              (data) => List<String>.from(data['video_urls'].map((data) => data['videoURL'])))))),
    );
  }
}
