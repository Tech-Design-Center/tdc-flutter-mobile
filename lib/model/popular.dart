import 'dart:convert';

List<Popular> popularListFromJson(String val) =>
    List<Popular>.from(json.decode(val)['data'].map((popular) => Popular.fromJson(popular)));

class Popular {
  final int? id;
  final String? image;
  final String? title;
  final String? documentURL;
  final String? telegramURL;
  final String? examURL;

  final String? author;
  final String? description;
  final int? duration;
  final int? price;
  final String? videoTrailerURL;
  final String? ABAPaymentURL;

  final List<String>? playlistTitle;
  final List<List<String>>? videoTitle;
  final List<List<String>>? videoUrl;
  Popular({
    required this.id,
    required this.image,
    required this.documentURL,
    required this.examURL,
    required this.telegramURL,
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

  factory Popular.fromJson(Map<String, dynamic> data) {
    return Popular(
      id: data['attributes']['course']['data']['id'],
      image: data['attributes']['course']['data']['attributes']['image']['data']['attributes']
          ['url'],
      title: data['attributes']['course']['data']['attributes']['title'],
      documentURL: data['attributes']['course']['data']['attributes']['documentURL'],
      examURL: data['attributes']['course']['data']['attributes']['examURL'],
      telegramURL: data['attributes']['course']['data']['attributes']['telegramURL'],
      author: data['attributes']['course']['data']['attributes']['author'],
      description: data['attributes']['course']['data']['attributes']['description'],
      duration: data['attributes']['course']['data']['attributes']['duration'],
      price: data['attributes']['course']['data']['attributes']['price'],
      videoTrailerURL: data['attributes']['course']['data']['attributes']['videoTrailerURL'],
      ABAPaymentURL: data['attributes']['course']['data']['attributes']['ABAPaymentURL'],
      playlistTitle: List<String>.from(data['attributes']['course']['data']['attributes']
              ['playlist_video_urls']['data']
          .map((data) => data['attributes']['title'])),
      videoTitle: List<List<String>>.from(data['attributes']['course']['data']['attributes']
              ['playlist_video_urls']['data']
          .map((e) => List<String>.from(
              e['attributes']['video_urls']['data'].map((e) => (e['attributes']['title']))))),
      videoUrl: List<List<String>>.from(data['attributes']['course']['data']['attributes']
              ['playlist_video_urls']['data']
          .map((e) => List<String>.from(
              e['attributes']['video_urls']['data'].map((e) => (e['attributes']['videoURL']))))),
    );
  }
}
