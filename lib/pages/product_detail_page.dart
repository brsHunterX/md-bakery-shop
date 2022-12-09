import 'package:flutter/material.dart';

import 'package:bakery_shop/models/product.dart';

class ProductDetailPage extends StatefulWidget {
  const ProductDetailPage({
    super.key,
  });

  @override
  State<ProductDetailPage> createState() => _ProductDetailPageState();
}

class _ProductDetailPageState extends State<ProductDetailPage> {

  AppBar _buildAppBar(String name) {
    return AppBar(
      title: Text(name),
    );
  }

  Widget _buildImage(String id, String imageUrl) {
    return SizedBox(
      height: 300.0,
      width: double.infinity,
      child: Hero(
        tag: id,
        child: Image.network(
          imageUrl,
          fit: BoxFit.cover
        ),
      ),
    );
  }

  Widget _buildDescription(String description) {
    return Container(
      padding: const EdgeInsets.all(24.0),
      child: Text(description)
    );
  }

  Widget _buildBody(Product product) {
    return SingleChildScrollView(
      child: Column(
        children: [
          _buildImage(product.id, product.imageUrl),
          _buildDescription(product.description)
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final Product product = ModalRoute.of(context)
      ?.settings
      .arguments as Product;

    return Scaffold(
      appBar: _buildAppBar(product.name),
      body: _buildBody(product),
    );
  }
}
