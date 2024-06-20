import 'package:souqey/Models/SubCategoriesModel/SubCategoriesModel.dart';

abstract interface class BaseSubCategoriesOnCategoryRepo {
  Future<SubCategoriesModel?>? getAllSubCategoriesOnCategory({required String? categoryId});
}
