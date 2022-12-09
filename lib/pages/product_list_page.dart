import 'package:bakery_shop/widgets/app_empty_state.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:bakery_shop/routers/routes.dart';

import 'package:bakery_shop/models/product.dart';

import 'package:bakery_shop/providers/product_provider.dart';
import 'package:bakery_shop/providers/transaction_provider.dart';

import 'package:bakery_shop/widgets/app_drawer.dart';
import 'package:bakery_shop/widgets/product_grid.dart';

enum FilterOptions {
  All,
  Favorite,
}

class ProductListPage extends StatefulWidget {
  const ProductListPage({super.key});

  @override
  State<ProductListPage> createState() => _ProductListPageState();
}

class _ProductListPageState extends State<ProductListPage> {

  bool _favoritesOnly = false;

  void _filterProducts(FilterOptions opt) {
    if (opt == FilterOptions.Favorite) {
      setState(() => _favoritesOnly = true);
    } else {
      setState(() => _favoritesOnly = false);
    }
  }

  AppBar _buildAppBar() {
    const List<PopupMenuItem<FilterOptions>> items = [
      PopupMenuItem(value: FilterOptions.All, child: Text('All')),
      PopupMenuItem(value: FilterOptions.Favorite, child: Text('Favorites')),
    ];

    final Widget filterButton = PopupMenuButton(
      icon: const Icon(Icons.more_vert_rounded),
      itemBuilder: (BuildContext ctx) => items,
      onSelected: (FilterOptions selected) => _filterProducts(selected),
    );

    return AppBar(
      title: const Text('Bakery Shop'),
      actions: [ filterButton ],
    );
  }

  Widget _buildFAB() {
    return Consumer<TransactionProvider>(
      builder: (BuildContext ctx, TransactionProvider prov, Widget? child) {
        return FloatingActionButton.extended(
          icon: const Icon(Icons.shopping_cart_rounded),
          label: Text(prov.count.toString()),
          onPressed: () => Navigator.of(context).pushNamed(ShopRouter.CART_LIST),
        );
      }
    );
  }

  Widget _buildGridList(List<Product> products) {
    return ProductGrid(
      products: products,
    );
  }

  Widget _buildEmptyState() {
    return const AppEmptyState(
      message: 'There are no registered products.',
    );
  }
  
  Widget _buildEmptyFavoritesState() {
    return AppEmptyState.action(
      message: 'There are no favorite products.',
      label: 'Show all products',
      onTap: () => _filterProducts(FilterOptions.All)
    );
  }

  Widget _buildBody() {
    return Consumer<ProductProvider>(
      builder: (BuildContext ctx, ProductProvider prov, _) {
        final List<Product> products = _favoritesOnly
          ? prov.favorites
          : prov.products;

        if (_favoritesOnly == false && products.isEmpty) {
          return _buildEmptyState();
        }
        
        if (_favoritesOnly == true && products.isEmpty) {
          return _buildEmptyFavoritesState();
        }

        return _buildGridList(products);
      }
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const AppDrawer(),
      appBar: _buildAppBar(),
      floatingActionButton: _buildFAB(),
      body: _buildBody(),
    );
  }
}
