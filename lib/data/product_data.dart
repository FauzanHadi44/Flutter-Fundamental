import 'package:flutter/material.dart';
import '../models/product_model.dart';
import '../models/category_model.dart';

// DATA KATEGORI
final List<CategoryModel> categories = [
  CategoryModel(
    id: 1,
    name: 'Tshirt',
    icon: Icons.checkroom,
  ),
  CategoryModel(
    id: 2,
    name: 'Shoes',
    icon: Icons.directions_run, 
  ),
  CategoryModel(
    id: 3,
    name: 'Bag',
    icon: Icons.shopping_bag, 
  ),
  CategoryModel(
    id: 4,
    name: 'Dress',
    icon: Icons.woman, 
  ),
  CategoryModel(
    id: 5,
    name: 'Watch',
    icon: Icons.watch,
  ),
  CategoryModel(
    id: 6,
    name: 'Pants',
    icon: Icons.straighten,
  ),
];

// DATA PRODUK
final List<ProductModel> products = [
  ProductModel(
    id: 1,
    name: 'Mint Leather Sneakers',
    price: 212.5,
    originalPrice: 250.0,
    discountPercent: 15,
    imageUrl:
        'https://images.unsplash.com/photo-1542291026-7eec264c27ff?w=400&q=80',
    category: 'Shoes',
  ),
  ProductModel(
    id: 2,
    name: 'Classic White Sneakers',
    price: 180.0,
    originalPrice: 200.0,
    discountPercent: 10,
    imageUrl:
        'https://images.unsplash.com/photo-1600269452121-4f2416e55c28?w=400&q=80',
    category: 'Shoes',
  ),
  ProductModel(
    id: 3,
    name: 'Dark Wash Denim Jacket',
    price: 212.5,
    originalPrice: 250.0,
    discountPercent: 15,
    imageUrl:
        'https://images.unsplash.com/photo-1551028719-00167b16eac5?w=400&q=80',
    category: 'Tshirt',
  ),
  ProductModel(
    id: 4,
    name: 'Urban Sport Watch',
    price: 180.0,
    originalPrice: 200.0,
    discountPercent: 10,
    imageUrl:
        'https://images.unsplash.com/photo-1523275335684-37898b6baf30?w=400&q=80',
    category: 'Watch',
  ),
  ProductModel(
    id: 5,
    name: 'Floral Summer Dress',
    price: 95.0,
    originalPrice: 120.0,
    discountPercent: 20,
    imageUrl:
        'https://images.unsplash.com/photo-1515372039744-b8f02a3ae446?w=400&q=80',
    category: 'Dress',
  ),
  ProductModel(
    id: 6,
    name: 'Leather Shoulder Bag',
    price: 145.0,
    originalPrice: 180.0,
    discountPercent: 19,
    imageUrl:
        'https://images.unsplash.com/photo-1548036328-c9fa89d128fa?w=400&q=80',
    category: 'Bag',
  ),
  ProductModel(
    id: 7,
    name: 'Classic Polo Tshirt',
    price: 45.0,
    originalPrice: 60.0,
    discountPercent: 25,
    imageUrl:
        'https://images.unsplash.com/photo-1586363104862-3a5e2ab60d99?w=400&q=80',
    category: 'Tshirt',
  ),
  ProductModel(
    id: 8,
    name: 'Elegant Tote Bag',
    price: 110.0,
    originalPrice: 140.0,
    discountPercent: 21,
    imageUrl:
        'https://images.unsplash.com/photo-1594938298603-c8148c4dae35?w=400&q=80',
    category: 'Bag',
  ),
];
