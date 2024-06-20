import 'dart:developer';

import 'package:injectable/injectable.dart';
import 'package:souqey/Models/SubCategoriesModel/SubCategoriesModel.dart';
import 'package:souqey/Screens/CategoriesScreen/Repository/BaseSubCategoriesOnCategoryRepo.dart';
import 'package:souqey/Screens/CategoriesScreen/Service/GetAllSubCategoriesOnCategoryService/GetAllSubCategoriesOnCategoryService.dart';

@injectable
class GetAllSubCategoriesOnCategoryRepoImpl implements BaseSubCategoriesOnCategoryRepo {
  SubCategoriesModel? _subCategoriesModel;
  GetAllSubCategoriesOnCategoryService? _subCategoriesOnCategoryService;

  GetAllSubCategoriesOnCategoryRepoImpl._SubCategoriesOnCategory({
    required GetAllSubCategoriesOnCategoryService? subCategoriesOnCategoryService,
  }) : _subCategoriesOnCategoryService = subCategoriesOnCategoryService;

  @factoryMethod
  factory GetAllSubCategoriesOnCategoryRepoImpl({
    @factoryParam required GetAllSubCategoriesOnCategoryService? subCategoriesOnCategoryService,
  }) =>
      GetAllSubCategoriesOnCategoryRepoImpl._SubCategoriesOnCategory(
        subCategoriesOnCategoryService: subCategoriesOnCategoryService,
      );

  @override
  Future<SubCategoriesModel?>? getAllSubCategoriesOnCategory({required String? categoryId}) async {
    try {
      if (_subCategoriesOnCategoryService != null) {
        _subCategoriesModel = await _subCategoriesOnCategoryService!.getCategories(categoryId: categoryId);
        return _subCategoriesModel!;
      } else {
        throw Exception("SubCategories Service Repo Failure");
      }
    } on Exception catch (e) {
      log(e.toString(), name: "SubCategories Repo Exception");
    }
    return null;
  }
}
