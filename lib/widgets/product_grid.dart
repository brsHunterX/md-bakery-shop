import 'package:flutter/material.dart';

import 'package:bakery_shop/models/product.dart';

import 'package:bakery_shop/widgets/product_tile.dart';

class ProductGrid extends StatelessWidget {
  
  final List<Product> products;

  const ProductGrid({
    Key? key,
    required this.products,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return GridView.builder(
      padding: const EdgeInsets.all(24.0),
      itemCount: products.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 8.0,
        crossAxisSpacing: 8.0,
        childAspectRatio: 3 / 4,
      ),
      itemBuilder: (BuildContext ctx, int i) => ProductTile(product: products[i])
    );
  }
}