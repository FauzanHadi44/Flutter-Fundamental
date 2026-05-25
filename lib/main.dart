import 'package:flutter/material.dart';
import 'screens/product_catalog_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Product Catalog',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFFE53935),
          brightness: Brightness.light,
        ),
        fontFamily: 'Roboto',
        useMaterial3: true,
      ),
      home: const ProductCatalogScreen(),
    );
  }
}
