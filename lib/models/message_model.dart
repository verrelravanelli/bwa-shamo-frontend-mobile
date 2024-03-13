import 'package:shamo/models/product_model.dart';

class MessageModel {
  String message;
  int userId;
  String userName;
  String userImage;
  bool isFromUser;
  ProductModel? product;
  DateTime createdAt;
  DateTime updatedAt;

  MessageModel({
    required this.message,
    required this.userId,
    required this.userName,
    required this.userImage,
    required this.createdAt,
    required this.updatedAt,
    required this.isFromUser,
    required this.product,
  });

  factory MessageModel.fromJson(Map<String, dynamic> json) {
    return MessageModel(
      message: json['message'],
      userId: json['userId'],
      userName: json['userName'],
      userImage: json['userImage'],
      createdAt: DateTime.parse(json['createdAt']),
      updatedAt: DateTime.parse(json['updatedAt']),
      isFromUser: json['isFromUser'],
      product: json['product'] == null ? null : ProductModel.fromJson(json['product']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "message": message,
      "userId": userId,
      "userName": userName,
      "userImage": userImage,
      "createdAt": createdAt.toString(),
      "updatedAt": updatedAt.toString(),
      "isFromUser": isFromUser,
      "product": product != null ? product!.toJson() : null,
    };
  }
}
