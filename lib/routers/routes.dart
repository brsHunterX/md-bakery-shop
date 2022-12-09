import 'package:flutter/material.dart';

import 'package:bakery_shop/pages/cart_list_page.dart';
import 'package:bakery_shop/pages/payments_list_page.dart';
import 'package:bakery_shop/pages/product_list_page.dart';
import 'package:bakery_shop/pages/product_detail_page.dart';

class ShopRouter {
  static const PRODUCT_LIST = '/';
  static const PRODUCT_DETAILS = '/products/details';
  static const CART_LIST = '/cart/list';
  static const PAYMENT_LIST = '/payments/list';

  static final routes = {
    PRODUCT_LIST: (BuildContext context) => const ProductListPage(),
    PRODUCT_DETAILS: (BuildContext context) => const ProductDetailPage(),
    CART_LIST: (BuildContext context) => const CartListPage(),
    PAYMENT_LIST: (BuildContext context) => const PaymentListPage(),
  };
}
