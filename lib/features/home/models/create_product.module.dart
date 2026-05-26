class CreateProductModel {
  final String title;
  final double price;
  final String description;
  final int categoryId;
  final List<String> images;

  CreateProductModel({
    required this.title,
    required this.price,
    required this.description,
    required this.categoryId,
    required this.images,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'title': title,
      'price': price,
      'description': description,
      'categoryId': categoryId,
      'images': images,
    };
  }
}
