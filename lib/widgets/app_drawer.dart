import 'package:flutter/material.dart';

import 'package:bakery_shop/routers/routes.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          ListTile(
            leading: CircleAvatar(
              backgroundColor: Theme.of(context).colorScheme.secondaryContainer,
              foregroundColor: Theme.of(context).colorScheme.onSecondaryContainer,
              child: const Text('JD'),
            ),
            title: const Text('Jhon Doe'),
            subtitle: const Text('jhon_doe@gmail.com'),
            trailing: IconButton(
              icon: const Icon(Icons.settings_rounded),
              onPressed: () {},
            ),
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.payment_rounded),
            title: const Text('Payments'),
            onTap: () => Navigator.of(context).pushNamed(ShopRouter.PAYMENT_LIST),
          ),
        ],
      ),
    );
  }
}