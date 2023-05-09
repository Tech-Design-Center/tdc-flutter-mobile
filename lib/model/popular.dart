import 'dart:convert';

List<Popular> popularListFromJson(String val) =>
    List<Popular>.from(json.decode(val)['data'].map((popular) => Popular.fromJson(popular)));

class Popular {
  final int id;
  final String image;
  final String title;
  final String documentURL;
  final String telegramURL;
  final String examURL;

  final String author;
  final String description;
  final int duration;
  final int price;
  final String videoTrailerURL;
  final String ABAPaymentURL;

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
      id: data['attributes']['course']['data']['id'] ?? 'Not Yet',
      image: data['attributes']['course']['data']['attributes']['image']['data']['attributes']
              ['url'] ??
          'Not Yet',
      title: data['attributes']['course']['data']['attributes']['title'] ?? 'Not Yet',
      documentURL: data['attributes']['course']['data']['attributes']['documentURL'] ?? 'Not Yet',
      examURL: data['attributes']['course']['data']['attributes']['examURL'] ?? 'Not Yet',
      telegramURL: data['attributes']['course']['data']['attributes']['telegramURL'] ?? 'Not Yet',
      author: data['attributes']['course']['data']['attributes']['author'] ?? 'Not Yet',
      description: data['attributes']['course']['data']['attributes']['description'] ?? 'Not Yet',
      duration: data['attributes']['course']['data']['attributes']['duration'] ?? 'Not Yet',
      price: data['attributes']['course']['data']['attributes']['price'] ?? 'Not Yet',
      videoTrailerURL:
          data['attributes']['course']['data']['attributes']['videoTrailerURL'] ?? 'Not Yet',
      ABAPaymentURL:
          data['attributes']['course']['data']['attributes']['ABAPaymentURL'] ?? 'Not Yet',
      playlistTitle: List<String>.from(data['attributes']['course']['data']['attributes']
                  ['playlist_video_urls']['data']
              .map((data) => data['attributes']['title']) ??
          'Not Yet'),
      videoTitle: List<List<String>>.from(data['attributes']['course']['data']['attributes']
                  ['playlist_video_urls']['data']
              .map((e) => List<String>.from(
                  e['attributes']['video_urls']['data'].map((e) => (e['attributes']['title'])))) ??
          'Not Yet'),
      videoUrl: List<List<String>>.from(data['attributes']['course']['data']['attributes']
                  ['playlist_video_urls']['data']
              .map((e) => List<String>.from(e['attributes']['video_urls']['data']
                  .map((e) => (e['attributes']['videoURL'])))) ??
          'Not Yet'),
    );
  }
}
