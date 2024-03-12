import 'package:shamo/models/category_model.dart';
import 'package:shamo/models/gallery_model.dart';

class ProductModel {
  final int id;
  final String name;
  final double price;
  final String description;
  final String? tags;
  final int categoriesId;
  final CategoryModel category;
  final List<Galleries> galleries;
  final DateTime createdAt;
  final DateTime updatedAt;

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
