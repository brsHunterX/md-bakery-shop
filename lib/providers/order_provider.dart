import 'dart:math';
import 'package:flutter/material.dart';

import 'package:bakery_shop/models/order.dart';
import 'package:bakery_shop/models/transaction.dart';

class OrderProvider with ChangeNotifier {
  final List<Order> _orders = [];

  List<Order> get orders => [..._orders];

  int get count => _orders.length;

  void add(List<Transaction> transactions) {
    final Order order = Order(
      id: Random().nextDouble().toString(),
      date: DateTime.now(),
      transactions: transactions,
    );

    _orders.insert(0, order);

    notifyListeners();
  }
}