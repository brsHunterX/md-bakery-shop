import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:bakery_shop/routers/routes.dart';

import 'package:bakery_shop/providers/order_provider.dart';

import 'package:bakery_shop/widgets/app_empty_state.dart';
import 'package:bakery_shop/widgets/payment_order_list_tile.dart';

class PaymentListPage extends StatefulWidget {
  const PaymentListPage({super.key});

  @override
  State<PaymentListPage> createState() => _PaymentListPageState();
}

class _PaymentListPageState extends State<PaymentListPage> {

  AppBar _buildAppBar() {
    return AppBar(
      title: const Text('Payments'),
    );
  }

  Widget _buildEmptyState() {
    return AppEmptyState.action(
      message: 'You have not made any payments.',
      label: 'Show all products',
      onTap: () => Navigator.of(context).pushNamed(ShopRouter.PRODUCT_LIST),
    );
  }

  Widget _buildListView(OrderProvider prov) {
    return ListView.separated(
      itemCount: prov.count,
      separatorBuilder: (BuildContext ctx, int i) => const Divider(),
      itemBuilder: (BuildContext ctx, int i) => PaymentOrderListTile(
        order: prov.orders[i]
      )
    );
  }

  Widget _buildBody() {
    return Consumer<OrderProvider>(
      builder: (BuildContext ctx, OrderProvider prov, Widget? child) {
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