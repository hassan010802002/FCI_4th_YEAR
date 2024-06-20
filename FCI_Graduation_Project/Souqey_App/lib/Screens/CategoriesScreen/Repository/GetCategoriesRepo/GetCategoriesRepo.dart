// ignore_for_file: file_names

import 'dart:developer';

import 'package:injectable/injectable.dart';
import 'package:souqey/Injections/Base_Injection.dart';
import 'package:souqey/Models/CategoriesModel/CategoriesModel.dart';
import 'package:souqey/Screens/CategoriesScreen/Repository/BaseGetCategoriesRepo.dart';
import 'package:souqey/Screens/CategoriesScreen/Service/GetCategoriesService/GetCategoriesService.dart';

@injectable
class GetCategoriesRepo implements BaseGetCategoriesRepo {
  CategoriesModel? _categoriesModel;
  GetCategoriesService? _categoriesService;

  GetCategoriesRepo._categoriesRepo() {
    _categoriesService = get_Locator_it.get<GetCategoriesService>();
  }
  @factoryMethod
  factory GetCategoriesRepo() => GetCategoriesRepo._categoriesRepo();

  @override
  Future<CategoriesModel?>? getCategories() async {
    try {
      if (_categoriesService != null) {
        _categoriesModel = await _categoriesService!.getCategories();
        return _categoriesModel;
      } else {
        throw Exception("Categories Service Repo Failure");
      }
    } on Exception catch (e) {
      log(e.toString(), name: "Categories Repo Exception");
    }
    return null;
  }
}
