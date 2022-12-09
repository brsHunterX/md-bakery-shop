import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:dynamic_color/dynamic_color.dart';

import 'package:bakery_shop/shared/app_theme_dark.dart';
import 'package:bakery_shop/shared/app_theme_light.dart';

import 'package:bakery_shop/routers/routes.dart';

import 'package:bakery_shop/providers/order_provider.dart';
import 'package:bakery_shop/providers/product_provider.dart';
import 'package:bakery_shop/providers/transaction_provider.dart';

void main() {
  runApp(const App());
}

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  Widget _buildMaterialApp(ColorScheme? lightDynamic, ColorScheme? darkDynamic) {
    return MaterialApp(
      initialRoute: '/',
      title: 'Bakery Shop',
      themeMode: ThemeMode.system,
      theme: AppThemeLight.theme.copyWith(
        colorScheme: lightDynamic ?? AppThemeLight.theme.colorScheme
      ),
      darkTheme: AppThemeDark.theme.copyWith(
        colorScheme: darkDynamic ?? AppThemeDark.theme.colorScheme
      ),
      debugShowCheckedModeBanner: false,
      routes: {
        ...ShopRouter.routes
      }
    );
  }

  Widget _buildDynamicColorsApp() {
    return DynamicColorBuilder(
      builder: (ColorScheme? lightDynamic, ColorScheme? darkDynamic) {
        return _buildMaterialApp(lightDynamic, darkDynamic);
      }
    );
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (BuildContext ctx) => ProductProvider()),
        ChangeNotifierProvider(create: (BuildContext ctx) => TransactionProvider()),
        ChangeNotifierProvider(create: (BuildContext ctx) => OrderProvider()),
      ],
      child: _buildDynamicColorsApp(),
    );
  }
}