import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:bakery_shop/models/transaction.dart';

import 'package:bakery_shop/providers/transaction_provider.dart';

class CardTransactionListTileCounter extends StatelessWidget {
  final Transaction transaction;

  const CardTransactionListTileCounter({
    super.key,
    required this.transaction,
  });

  @override
  Widget build(BuildContext context) {
    final TransactionProvider prov = Provider.of<TransactionProvider>(
      context, listen: false
    );
    
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        IconButton(
          iconSize: 16.0,
          splashRadius: 18.0,
          icon: const Icon(Icons.remove),
          color: Theme.of(context).colorScheme.secondary,
          onPressed: () => prov.remove(transaction.product), 
        ),
        Text(transaction.quantity.toString()),
        IconButton(
          iconSize: 16.0,
          splashRadius: 18.0,
          icon: const Icon(Icons.add),
          color: Theme.of(context).colorScheme.secondary,
          onPressed: () => prov.add(transaction.product), 
        ),
      ],
    );
  }
}