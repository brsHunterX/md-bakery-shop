import 'package:flutter/material.dart';

import 'package:bakery_shop/data/products.dart';

import 'package:bakery_shop/models/product.dart';

class ProductProvider with ChangeNotifier {
  final List<Product> _products = productsData;

  // bool get inLoading => _inLoading;
  List<Product> get products => [..._products];
  List<Product> get favorites => _products
    .where((Product product) => product.isFavorite)
    .toList();

  void add(Product product) {
    _products.add(product);
    notifyListeners();
  }

  void toggleFavorite(Product product) {
    product.toggleFavorite();
    notifyListeners();
  }
}
