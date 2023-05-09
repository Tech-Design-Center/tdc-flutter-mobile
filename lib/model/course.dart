import 'dart:convert';

List<Course> courseListFromJson(String val) =>
    List<Course>.from(json.decode(val).map((data) => Course.fromJson(data)));

class Course {
  final String email;
  final List<DateTime> purchaseDate;
  final List<String> image;
  final List<String> documentURL;
  final List<String> examURL;
  final List<String> telegramURL;
  final List<String> title;
  final List<String> author;
  final List<String> description;
  final List<int> duration;
  final List<int> price;
  final List<String> videoTrailerURL;
  final List<String> ABAPaymentURL;
  final List<List<String>> playlistTitle;
  final List<List<List<String>>> videoTitle;
  final List<List<List<String>>> videoUrl;

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
      email: data['email'] ?? 'Not Yet',
      purchaseDate: List<DateTime>.from(
          data['course_user_links'].map((data) => DateTime.parse(data['publishedAt'].toString())) ??
              'Not Yet'),
      documentURL: List<String>.from(
          data['course_user_links'].map((data) => data['course']['documentURL']) ?? 'Not Yet'),
      examURL: List<String>.from(
          data['course_user_links'].map((data) => data['course']['examURL']) ?? 'Not Yet'),
      telegramURL: List<String>.from(
          data['course_user_links'].map((data) => data['course']['telegramURL']) ?? 'Not Yet'),
      image: List<String>.from(
          data['course_user_links'].map((data) => data['course']['image']['url']) ?? 'Not Yet'),
      title: List<String>.from(
          data['course_user_links'].map((data) => data['course']['title']) ?? 'Not Yet'),
      author: List<String>.from(
          data['course_user_links'].map((data) => data['course']['author']) ?? 'Not Yet'),
      description: List<String>.from(
          data['course_user_links'].map((data) => data['course']['description']) ?? 'Not Yet'),
      duration: List<int>.from(
          data['course_user_links'].map((data) => data['course']['duration']) ?? 'Not Yet'),
      price: List<int>.from(
          data['course_user_links'].map((data) => data['course']['price']) ?? 'Not Yet'),
      videoTrailerURL: List<String>.from(
          data['course_user_links'].map((data) => data['course']['videoTrailerURL']) ?? 'Not Yet'),
      ABAPaymentURL: List<String>.from(
          data['course_user_links'].map((data) => data['course']['ABAPaymentURL']) ?? 'Not Yet'),
      playlistTitle: List<List<String>>.from(data['course_user_links'].map((data) =>
              List<String>.from(
                  data['course']['playlist_video_urls'].map((data) => data['title']))) ??
          'Not Yet'),
      videoTitle: List<List<List<String>>>.from(data['course_user_links'].map((data) =>
              List<List<String>>.from(data['course']['playlist_video_urls'].map(
                  (data) => List<String>.from(data['video_urls'].map((data) => data['title']))))) ??
          'Not Yet'),
      videoUrl: List<List<List<String>>>.from(data['course_user_links'].map((data) =>
              List<List<String>>.from(data['course']['playlist_video_urls'].map((data) =>
                  List<String>.from(data['video_urls'].map((data) => data['videoURL']))))) ??
          'Not Yet'),
    );
  }
}
