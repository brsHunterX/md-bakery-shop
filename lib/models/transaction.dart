import 'package:bakery_shop/models/product.dart';

class Transaction {
  final String id;
  final Product product;
  
  int quantity = 1;

  Transaction({
    required this.id,
    required this.product,
  });

  double total() {
    return product.price * quantity;
  }
}
