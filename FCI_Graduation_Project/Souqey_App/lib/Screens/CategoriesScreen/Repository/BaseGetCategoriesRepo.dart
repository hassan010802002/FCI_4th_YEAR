// ignore_for_file: file_names

import 'package:souqey/Models/CategoriesModel/CategoriesModel.dart';

abstract class BaseGetCategoriesRepo {
  Future<CategoriesModel?>? getCategories();
}
