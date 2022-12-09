
import 'package:flutter/material.dart';

import 'package:bakery_shop/models/transaction.dart';

import 'package:bakery_shop/widgets/cart_transaction_list_tile_counter.dart';

class CartTransactionListTile extends StatelessWidget {
  final Transaction transaction;

  const CartTransactionListTile({
    super.key,
    required this.transaction,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        backgroundImage: NetworkImage(transaction.product.imageUrl),
      ),
      title: Text(transaction.product.name),
      subtitle: Text('R\$ ${transaction.total().toStringAsFixed(2)}'),
      trailing: CardTransactionListTileCounter(transaction: transaction,)
    );
  }
}