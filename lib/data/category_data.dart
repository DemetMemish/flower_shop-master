import 'package:flower_shop/model/category_model.dart';
import 'package:flutter/material.dart';

List categoryData = [
  CategoryModel(
    title: 'Categories',
    icon: Icons.local_florist,
    active: true,
  ),
  CategoryModel(
    title: "Flowers",
    icon: Icons.local_florist,
    active: false,
  ),
  CategoryModel(
    title: "Favorites",
    icon: Icons.favorite,
    active: false,
  ),
  CategoryModel(
    title: "Basket",
    icon: Icons.shopping_basket,
    active: false,
  ),
];
