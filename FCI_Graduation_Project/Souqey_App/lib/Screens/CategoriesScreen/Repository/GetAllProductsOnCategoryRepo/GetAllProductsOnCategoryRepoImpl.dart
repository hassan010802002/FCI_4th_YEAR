import 'dart:developer';

import 'package:injectable/injectable.dart';
import 'package:souqey/Models/AllProductsModel/AllProductsModel.dart';
import 'package:souqey/Screens/CategoriesScreen/Repository/BaseGetAllProductsOnCategoryRepo.dart';
import 'package:souqey/Screens/CategoriesScreen/Service/GetAllProductsOnCategoryService/GetAllProductsOnCategoryService.dart';

@injectable
class GetAllProductsOnCategoryRepoImpl implements BaseGetAllProductsOnCategoryRepo {
  AllProductsModel? _productsOnCategoryModel;
  GetAllProductsOnCategoryService? _getAllProductsOnCategoryService;
  @factoryMethod
  factory GetAllProductsOnCategoryRepoImpl({
    @factoryParam required GetAllProductsOnCategoryService? getAllProductsOnCategoryService,
  }) =>
      GetAllProductsOnCategoryRepoImpl._productsOnCategoryRepo(
        getAllProductsOnCategoryService: getAllProductsOnCategoryService,
      );

  @override
  Future<AllProductsModel?>? getAllProductsOnCategory({required String? categoryId}) async {
    try {
      if (_getAllProductsOnCategoryService != null) {
        _productsOnCategoryModel = await _getAllProductsOnCategoryService!.getAllProductsOnCategory(categoryId: categoryId);
        return _productsOnCategoryModel;
      } else {
        throw Exception("Products on Category Service Repo Failure");
      }
    } on Exception catch (e) {
      log(e.toString(), name: "Products on Category Repo Exception");
    }
    return null;
  }

  GetAllProductsOnCategoryRepoImpl._productsOnCategoryRepo({
    required GetAllProductsOnCategoryService? getAllProductsOnCategoryService,
  }) : _getAllProductsOnCategoryService = getAllProductsOnCategoryService;
}
