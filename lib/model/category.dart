import 'dart:convert';

List<Category> categoryListFromJson(String val) => List<Category>.from(json
    .decode(val)['data']
    .map((category) => Category.categoryFromJson(category)));

class Category {
  final int id;
  final String name;
  final String image;

  Category({required this.id, required this.name, required this.image});

  factory Category.categoryFromJson(Map<String, dynamic> data) => Category(
      id: data['id'],
      name: data['attributes']['name'],
      image: data['attributes']['image']['data']['attributes']['url']);
}
