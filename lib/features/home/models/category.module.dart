import 'dart:convert';

class CategoryModel {
  final int id;
  final String name;
  final String image;
  final String createdAt;
  final String updatedAt;

  const CategoryModel({
    required this.id,
    required this.name,
    required this.image,
    required this.createdAt,
    required this.updatedAt,
  });

  factory CategoryModel.fromJsonMap(Map<String, dynamic> map) {
    return CategoryModel(
      id: map['id'],
      name: map['name'],
      image: map['image'],
      createdAt: map['creationAt'],
      updatedAt: map['updatedAt'],
    );
  }

  CategoryModel copyWith({
    String? name,
    String? image,
    String? createdAt,
    String? updatedAt,
  }) {
    return CategoryModel(
      id: id,
      name: name ?? this.name,
      image: image ?? this.image,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'image': image,
      'createdAt': createdAt,
      'updatedAt': updatedAt,
    };
  }

  factory CategoryModel.fromMap(Map<String, dynamic> map) {
    return CategoryModel(
      id: map['id'] as int,
      name: map['name'] as String,
      image: map['image'],
      createdAt: (map['createdAt'] ?? map['creationAt']) as String,
      updatedAt: map['updatedAt'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory CategoryModel.fromJson(String source) =>
      CategoryModel.fromMap(json.decode(source) as Map<String, dynamic>);
}

        // "id": 3,
        // "name": "Clothes",
        // "image": "https://i.imgur.com/Qphac99.jpeg",
        // "creationAt": "2025-01-13T04:30:28.000Z",
        // "updatedAt": "2025-01-13T12:51:27.000Z"
