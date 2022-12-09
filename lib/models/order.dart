import 'package:bakery_shop/models/transaction.dart';

class Order {
  final String id;
  final DateTime date;
  final List<Transaction> transactions;

  Order({
    required this.id,
    required this.date,
    required this.transactions,
  });

  double total() {
    return transactions
      .map((Transaction transaction) => transaction.total())
      .fold(0.0, (double previousTotal, double total) => previousTotal + total);
  }
}