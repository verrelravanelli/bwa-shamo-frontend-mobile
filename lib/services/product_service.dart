import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:shamo/models/product_model.dart';

class ProductService {
  String baseUrl = 'http://10.0.2.2/shamo-backend/public/api';

  Future<List<ProductModel>> getProducts() async {
    var url = '$baseUrl/products';
    var headers = {
      HttpHeaders.contentTypeHeader: 'application/json',
    };

    var response = await http.get(
      Uri.parse(url),
      headers: headers,
    );

    if (response.statusCode == 200) {
      List data = jsonDecode(response.body)['data']['data'];
      List<ProductModel> products = data.map((e) => ProductModel.fromJson(e)).toList();

      return products;
    } else {
      throw Exception('Gagal Get Products');
    }
  }
}
