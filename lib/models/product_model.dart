import 'package:shamo/models/category_model.dart';
import 'package:shamo/models/gallery_model.dart';

class ProductModel {
  int id;
  String name;
  double price;
  String description;
  String? tags;
  int categoriesId;
  CategoryModel category;
  List<Galleries> galleries;
  DateTime createdAt;
  DateTime updatedAt;

  ProductModel({
    required this.id,
    required this.name,
    required this.price,
    required this.description,
    required this.tags,
    required this.categoriesId,
    required this.galleries,
    required this.category,
    required this.createdAt,
    required this.updatedAt,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json['id'],
      name: json['name'],
      price: double.parse(json['price'].toString()),
      description: json['description'],
      tags: json['tags'],
      categoriesId: json['categories_id'],
      galleries: (json['galleries'] as List<dynamic>).map((gallery) => Galleries.fromJson(gallery)).toList(),
      category: CategoryModel.fromJson(json['category']),
      createdAt: DateTime.parse(json['created_at']),
      updatedAt: DateTime.parse(json['updated_at']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'price': price,
      'description': description,
      'tags': tags,
      'categories_id': categoriesId,
      'galleries': galleries.map((e) => e.toJson()).toList(),
      'category': category.toJson(),
      'created_at': createdAt.toString(),
      'updated_at': updatedAt.toString(),
    };
  }
}

// class UninitializedProductModel extends ProductModel {
//   UninitializedProductModel(
//       {required super.id,
//       required super.name,
//       required super.price,
//       required super.description,
//       required super.tags,
//       required super.categoriesId,
//       required super.galleries,
//       required super.category,
//       required super.createdAt,
//       required super.updatedAt});
// }
