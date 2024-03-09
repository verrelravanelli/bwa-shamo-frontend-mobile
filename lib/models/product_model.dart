class ProductModel {
  final int id;
  final String name;
  final int price;
  final String description;
  final String? tags;
  final int categoriesId;
  final List<Galleries>? galleries;

  ProductModel({
    required this.id,
    required this.name,
    required this.price,
    required this.description,
    required this.tags,
    required this.categoriesId,
    required this.galleries,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    List<dynamic>? tempListItem = json['galleries'] != null ? json['galleries'] as List : null;
    List<Galleries>? data;
    if (tempListItem != null) {
      data = tempListItem.map((e) => Galleries.fromJson(e)).toList();
    }
    return ProductModel(
      id: json['id'],
      name: json['name'],
      price: json['price'],
      description: json['description'],
      tags: json['tags'],
      categoriesId: json['categories_id'],
      galleries: data,
    );
  }
}

class Galleries {
  final int id;
  final int products_id;
  final String url;

  Galleries({
    required this.id,
    required this.products_id,
    required this.url,
  });

  factory Galleries.fromJson(Map<String, dynamic> json) {
    return Galleries(id: json['id'], products_id: json['products_id'], url: json['url']);
  }
}
