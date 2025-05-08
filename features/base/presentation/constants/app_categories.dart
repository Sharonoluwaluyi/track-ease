import 'package:flutter/material.dart';

import '../../../../core/constants/app_assets.dart' show AppAssets;
import '../models/category_model.dart' show CategoryModel;

class AppCategories {
  static final CategoryModel general = CategoryModel(
    color: Color(0xFF68DAC3),
    icon: AppAssets.groceries,
    name: 'General',
  );
  static final CategoryModel groceries = CategoryModel(
    color: Color(0xFFF0640C),
    icon: AppAssets.groceries,
    name: 'Groceries',
  );
  static final CategoryModel eatingOut = CategoryModel(
    color: Color(0xFF0890FE),
    icon: AppAssets.eatingOut,
    name: 'Eating Out',
  );
  static final CategoryModel transport = CategoryModel(
    color: Color(0xFFFFAF2A),
    icon: AppAssets.transport,
    name: 'Transport',
  );
  static final CategoryModel bills = CategoryModel(
    color: Color(0xFFB30000),
    icon: AppAssets.bills,
    name: 'Bills',
  );
  static final CategoryModel shopping = CategoryModel(
    color: Color(0xFF900D92),
    icon: AppAssets.shopping,
    name: 'Shopping',
  );
  static final CategoryModel income = CategoryModel(
    color: Color(0xFF0D9212),
    icon: AppAssets.income,
    name: 'Income',
  );

  /// 👇 Add a static list containing all categories
  static final List<CategoryModel> all = [
    general,
    groceries,
    eatingOut,
    transport,
    bills,
    shopping,
    income,
  ];
}
