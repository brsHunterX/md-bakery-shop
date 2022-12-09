import 'package:intl/intl.dart';
import 'package:flutter/material.dart';

import 'package:bakery_shop/models/order.dart';
import 'package:bakery_shop/models/transaction.dart';

class PaymentOrderListTile extends StatelessWidget {
  final Order order;

  const PaymentOrderListTile({
    super.key,
    required this.order,
  });

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
      child: ExpansionTile(
        leading: const Icon(Icons.shopping_bag_outlined),
        title: Text('R\$ ${order.total().toStringAsFixed(2)}'),
        subtitle: Text(DateFormat('dd/MM/yyyy hh:mm').format(order.date)),
        children: order.transactions
          .map((Transaction transaction) => ListTile(
            leading: CircleAvatar(
              backgroundImage: NetworkImage(transaction.product.imageUrl),
            ),
            title: Text(transaction.product.name),
            subtitle: Text('R\$ ${transaction.total().toStringAsFixed(2)}'),
            trailing: Chip(
              label: Text('${transaction.quantity}x'),
              backgroundColor: Theme.of(context).colorScheme.secondaryContainer,
              labelStyle: TextStyle(color: Theme.of(context).colorScheme.onSecondaryContainer),
            ),
          ))
          .toList(),
      ),
    );
  }
}