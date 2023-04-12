import 'dart:convert';

List<Popular> popularListFromJson(String val) =>
    List<Popular>.from(json.decode(val)['data'].map((popular) => Popular.fromJson(popular)));

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
  final List<String> playlistTitle;
  final List<List<String>> videoTitle;
  final List<List<String>> videoUrl;
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
    required this.playlistTitle,
    required this.videoTitle,
    required this.videoUrl,
  });

  factory Popular.fromJson(Map<String, dynamic> data) {
    final videoTitleList = List<List<String>>.from(data['attributes']['course']['data']
                ['attributes']['playlist_video_urls']['data']
            .map((e) => List<String>.from(
                e['attributes']['video_urls']['data'].map((e) => (e['attributes']['title'])))))
        .toList();
    final videoUrlList = List<List<String>>.from(data['attributes']['course']['data']['attributes']
                ['playlist_video_urls']['data']
            .map((e) => List<String>.from(
                e['attributes']['video_urls']['data'].map((e) => (e['attributes']['videoURL'])))))
        .toList();
    return Popular(
      id: data['attributes']['course']['data']['id'],
      image: data['attributes']['course']['data']['attributes']['image']['data']['attributes']
          ['url'],
      title: data['attributes']['course']['data']['attributes']['title'],
      author: data['attributes']['course']['data']['attributes']['author'],
      description: data['attributes']['course']['data']['attributes']['description'],
      about: data['attributes']['course']['data']['attributes']['about'],
      duration: data['attributes']['course']['data']['attributes']['duration'],
      price: data['attributes']['course']['data']['attributes']['price'],
      videoTrailerId: data['attributes']['course']['data']['attributes']['videoTrailerURL'],
      isEnroll: data['attributes']['course']['data']['attributes']['isEnroll'],
      playlistTitle: List<String>.from(data['attributes']['course']['data']['attributes']
              ['playlist_video_urls']['data']
          .map((data) => data['attributes']['title'])),
      videoTitle: videoTitleList,
      videoUrl: videoUrlList,
    );
  }
}
