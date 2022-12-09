

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:bakery_shop/routers/routes.dart';

import 'package:bakery_shop/models/transaction.dart';

import 'package:bakery_shop/providers/order_provider.dart';
import 'package:bakery_shop/providers/transaction_provider.dart';


class CartOrderListTile extends StatelessWidget {
  final double total;
  final List<Transaction> transactions;

  const CartOrderListTile({
    super.key,
    required this.total,
    required this.transactions,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: const Text('Total'),
      subtitle: Text('R\$ ${total.toStringAsFixed(2)}'),
      trailing: TextButton.icon(
        icon: const Icon(Icons.shopping_cart_checkout_rounded),
        label: const Text('Checkout'),
        onPressed: () {
          Provider.of<OrderProvider>(context, listen: false).add(transactions);
          Provider.of<TransactionProvider>(context, listen: false).clean();
          Navigator.of(context).pushNamed(ShopRouter.PAYMENT_LIST);
        },
      ),
    );
  }
}