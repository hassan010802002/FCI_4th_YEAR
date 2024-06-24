import 'package:souqey/Models/AllProductsModel/AllProductsModel.dart';

abstract interface class BaseGetAllProductsOnCategoryRepo {
  Future<AllProductsModel?>? getAllProductsOnCategory({required String? categoryId});
}
