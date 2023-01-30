class ProductFields {
  static const id = 'id';
  static const categoryId = 'category_id';
  static const name = 'name';
  static const price = 'price';
  static const imageUrl = 'image_url';
}

class ProductModel {
  int id;
  int categoryId;
  String name;
  int price;
  String imageUrl;

  ProductModel({
    required this.id,
    required this.categoryId,
    required this.name,
    required this.price,
    required this.imageUrl,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json[ProductFields.id] as int? ?? 0,
      categoryId: json[ProductFields.categoryId] as int? ?? 0,
      name: json[ProductFields.name] as String? ?? "",
      price: json[ProductFields.price] as int? ?? 0,
      imageUrl: json[ProductFields.imageUrl] as String? ?? "",
    );
  }

  toJson() {
    return {
      ProductFields.id: id,
      ProductFields.categoryId: categoryId,
      ProductFields.name: name,
      ProductFields.price: price,
      ProductFields.imageUrl: imageUrl,
    };
  }
}
