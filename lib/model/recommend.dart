import 'dart:convert';

List<Recommend> recommendListFromJson(String val) => List<Recommend>.from(
    json.decode(val)['data'].map((recommend) => Recommend.fromJson(recommend)));

class Recommend {
  final int id;
  final String image;
  final String title;
  final String author;
  final String description;
  final String about;
  final int duration;
  final int price;
  final String videoTrailerURL;
  final List<String> playlistTitle;
  final List<List<String>> videoTitle;
  final List<List<String>> videoUrl;

  Recommend({
    required this.id,
    required this.image,
    required this.title,
    required this.author,
    required this.description,
    required this.about,
    required this.duration,
    required this.price,
    required this.videoTrailerURL,
    required this.playlistTitle,
    required this.videoTitle,
    required this.videoUrl,
  });

  factory Recommend.fromJson(Map<String, dynamic> data) {
    return Recommend(
      id: data['attributes']['course']['data']['id'],
      image: data['attributes']['course']['data']['attributes']['image']['data']['attributes']
          ['url'],
      title: data['attributes']['course']['data']['attributes']['title'],
      author: data['attributes']['course']['data']['attributes']['author'],
      description: data['attributes']['course']['data']['attributes']['description'],
      about: data['attributes']['course']['data']['attributes']['about'],
      duration: data['attributes']['course']['data']['attributes']['duration'],
      price: data['attributes']['course']['data']['attributes']['price'],
      videoTrailerURL: data['attributes']['course']['data']['attributes']['videoTrailerURL'],
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
