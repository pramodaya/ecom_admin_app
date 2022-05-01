import 'package:flutter/material.dart';

class ProductCategory {
  final int id;
  final String text;
  final IconData icon;

  ProductCategory({
    required this.id,
    required this.text,
    required this.icon
  });
}

// Our demo Product Categories

List<ProductCategory> demoProductCategories = [
  ProductCategory(
    id: 1,
    text: "Gents",
    icon: Icons.menu_book,
  ),
    ProductCategory(
    id: 1,
    text: "Ladies",
    icon: Icons.menu_book,
  ),
    ProductCategory(
    id: 1,
    text: "Babies",
    icon: Icons.menu_book,
  ),
    ProductCategory(
    id: 1,
    text: "Other",
    icon: Icons.menu_book,
  ),

];

