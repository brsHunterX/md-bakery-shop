import 'dart:convert';
import 'package:flutter/services.dart';

import 'package:bakery_shop/models/product.dart';

class ProductService {
  Future<List<dynamic>> loadJson() async {
    final String response = await rootBundle
      .loadString('assets/data/products.json');

    return await json.decode(response);
  }

  Future<List<Product>> list() async {
    try {
      final List<dynamic> response = await loadJson();

      await Future.delayed(const Duration(seconds: 3));

      return response
        .map((dynamic product) => Product.fromJson(product))
        .toList();
    } catch (e) {
      rethrow;
    }
  }

}