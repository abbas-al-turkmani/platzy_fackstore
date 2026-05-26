import 'category.module.dart';

class ProductModel {
  int id;
  String title;
  num price;
  num? discount;
  String description;
  List<String> images;
  String creationAt;
  String updatedAt;
  CategoryModel category;
  final bool isFavourite;

  ProductModel({
    required this.id,
    required this.title,
    required this.price,
    this.discount,
    required this.description,
    required this.images,
    required this.creationAt,
    required this.updatedAt,
    required this.category,
    required this.isFavourite,
  });

  ProductModel copyWith({
    String? title,
    num? price,
    num? discount,
    String? description,
    List<String>? images,
    String? creationAt,
    String? updatedAt,
    CategoryModel? category,
    bool? isFavourite,
  }) {
    return ProductModel(
      id: id,
      title: title ?? this.title,
      price: price ?? this.price,
      discount: discount ?? this.discount,
      description: description ?? this.description,
      images: images ?? this.images,
      creationAt: creationAt ?? this.creationAt,
      updatedAt: updatedAt ?? this.updatedAt,
      category: category ?? this.category,
      isFavourite: isFavourite ?? this.isFavourite,
    );
  }

  Map<String, dynamic> toMap() => <String, dynamic>{
        'id': id,
        'title': title,
        'price': price,
        'discount': discount,
        'description': description,
        'images': images,
        'creationAt': creationAt,
        'updatedAt': updatedAt,
        'category': category.toMap(),
        'isFavourite': isFavourite,
      };

  factory ProductModel.fromMap(Map<String, dynamic> map) => ProductModel(
        id: map['id'] as int,
        title: map['title'] as String,
        price: map['price'] as num,
        discount: map['discount'] != null ? map['discount'] as num : null,
        description: map['description'] as String,
        images: List<String>.generate(
          (map['images'] as List<dynamic>).length,
          (index) => map['images'][index],
        ),
        creationAt: map['creationAt'] as String,
        updatedAt: map['updatedAt'] as String,
        isFavourite: (map['isFavourite'] ?? false) as bool,
        category:
            CategoryModel.fromMap(map['category'] as Map<String, dynamic>),
      );
}

// "id": 29,
// "title": "fhfiuju",
// "price": 24,
// "description": "1Elevate your dining room with this sleek Mid-Century Modern dining table, featuring an elegant walnut finish and tapered legs for a timeless aesthetic. Its sturdy wood construction and minimalist design make it a versatile piece that fits with a variety of decor styles. Perfect for intimate dinners or as a stylish spot for your morning coffee.",
// "images": [
//     "[
//     \"https://i.imgur.com/DMQHGA0.jpeg\"",
//     "\"https://i.imgur.com/qrs9QBg.jpeg\"",
//     "\"https://i.imgur.com/XVp8T1I.jpeg\"
//   ]"
// ],
// "creationAt": "2025-01-13T04:30:28.000Z",
// "updatedAt": "2025-01-13T15:33:27.000Z",
// "category": {
//     "id": 3,
//     "name": "nuevo",
//     "image": "https://i.imgur.com/Qphac99.jpeg",
//     "creationAt": "2025-01-13T04:30:28.000Z",
//     "updatedAt": "2025-01-13T16:05:13.000Z"
// }
