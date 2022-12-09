import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:bakery_shop/routers/routes.dart';

import 'package:bakery_shop/models/product.dart';

import 'package:bakery_shop/providers/product_provider.dart';
import 'package:bakery_shop/providers/transaction_provider.dart';

class ProductTile extends StatelessWidget {

  final Product product;

  const ProductTile({
    super.key,
    required this.product
  });

  Widget _buildImage(BuildContext context) {
    return GestureDetector(
      child: Hero(
        tag: product.id,
        child: Image.network(
          product.imageUrl,
          fit: BoxFit.cover,
        ),
      ),
      onTap: () => Navigator.of(context)
        .pushNamed(ShopRouter.PRODUCT_DETAILS, arguments: product)
    );
  }
  
  Widget _buildHeader(BuildContext context) {
    final ProductProvider prov = Provider.of<ProductProvider>(
      context, listen: false
    );

    final Color activeIconColor = Theme.of(context).brightness == Brightness.dark
      ? Theme.of(context).colorScheme.primary
      : Theme.of(context).colorScheme.primaryContainer;

    final Color iconColor = product.isFavorite
      ? activeIconColor
      : Colors.white;

    return Align(
      alignment: Alignment.centerRight,
      child: IconButton(
        color: iconColor,
        icon: const Icon(Icons.favorite_rounded),
        onPressed: () => prov.toggleFavorite(product),
      ),
    );
  }

  Widget _buildFooter(BuildContext context) {
    final TransactionProvider prov = Provider.of<TransactionProvider>(
      context, listen: false
    );

    final Color textColor = Theme.of(context).brightness == Brightness.dark
      ? Theme.of(context).colorScheme.primary
      : Theme.of(context).colorScheme.primaryContainer;

    final Text subtitle = Text(
      'R\$${product.price.toStringAsFixed(2)}',
      style: TextStyle(color: textColor),
    );
    
    return GridTileBar(
      title: Text(product.name),
      subtitle: subtitle,
      backgroundColor: Colors.black.withOpacity(0.75),
      trailing: IconButton(
        // color: Theme.of(context).colorScheme.tertiary,
        icon: const Icon(Icons.add_shopping_cart_rounded),
        onPressed: () => prov.add(product),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {

    return ClipRRect(
      borderRadius: BorderRadius.circular(16.0),
      child: GridTile(
        header: _buildHeader(context),
        footer: _buildFooter(context),
        child: _buildImage(context),
      ),
    );
  }
}