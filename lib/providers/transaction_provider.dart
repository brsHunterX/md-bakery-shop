import 'dart:math';
import 'package:flutter/material.dart';

import 'package:bakery_shop/models/product.dart';
import 'package:bakery_shop/models/transaction.dart';

class TransactionProvider with ChangeNotifier {
  final List<Transaction> _transactions = [];

  int get count => _transactions.length;
  
  List<Transaction> get transactions => [..._transactions];

  double get total => _transactions
    .map((Transaction transaction) => transaction.total())
    .fold(0.0, (previousTotal, total) => previousTotal + total); 

  void clean() {
    _transactions.clear();
    
    notifyListeners();
  }

  void remove(Product product) {
    final index = _transactions.indexWhere((Transaction transaction) {
      return transaction.product.id == product.id;
    });

    if (_transactions[index].quantity > 1) {
      _transactions[index].quantity--;
    } else {
      _transactions.remove(_transactions[index]);
    }

    notifyListeners();
  }

  void add(Product product) {
    final index = _transactions.indexWhere((Transaction transaction) {
      return transaction.product.id == product.id;
    });
    
    if (index != -1) {
      _transactions[index].quantity++;
    } else {
      final Transaction transaction = Transaction(
        id: Random().nextDouble().toString(),
        product: product
      );

      _transactions.add(transaction);
    }
    
    notifyListeners();
  }
}
