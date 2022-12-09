import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:bakery_shop/models/transaction.dart';

import 'package:bakery_shop/providers/transaction_provider.dart';

import 'package:bakery_shop/widgets/app_empty_state.dart';
import 'package:bakery_shop/widgets/cart_order_list_tile.dart';
import 'package:bakery_shop/widgets/cart_transaction_list_tile.dart';

class CartListPage extends StatefulWidget {
  const CartListPage({super.key});

  @override
  State<CartListPage> createState() => _CartListPageState();
}

class _CartListPageState extends State<CartListPage> {

  AppBar _buildAppBar() {
    final Widget cleanButton = IconButton(
      tooltip: 'Remove all items',
      icon: const Icon(Icons.clear_all_rounded),
      onPressed: () => Provider.of<TransactionProvider>(context, listen: false),
    );

    return AppBar(
      title: const Text('Cart'),
      actions: [cleanButton],
    );
  }

  Widget _buildEmptyState() {
    return AppEmptyState.action(
      message: 'You don\'t have any products in your cart.',
      label: 'View products',
      onTap: () => Navigator.of(context).pop(),
    ); 
  }

  Widget _buildListView(TransactionProvider prov) {
    final List<Widget> transactions = prov.transactions
      .map((Transaction transaction) => CartTransactionListTile(transaction: transaction))
      .toList();

    return ListView(
      children: [
        ...transactions,
        const Divider(),
        CartOrderListTile(
          total: prov.total,
          transactions: prov.transactions,
        ),
      ],
    );
  } 

  Widget _buildBody() {
    return Consumer<TransactionProvider>(
      builder: (BuildContext ctx, TransactionProvider prov, _) {
        if (prov.count <= 0) {
          return _buildEmptyState();
        }

        return _buildListView(prov);
      }
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: _buildBody(),
    );
  }
}