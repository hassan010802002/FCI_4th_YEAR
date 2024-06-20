import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:injectable/injectable.dart';
import 'package:souqey/Config/AppConfigs.dart';
import 'package:souqey/Models/SubCategoriesModel/SubCategoriesModel.dart';

@injectable
class GetAllSubCategoriesOnCategoryService {
  SubCategoriesModel? _subCategoriesModel;

  Future<SubCategoriesModel?>? getCategories({required String? categoryId}) async {
    try {
      final http.Response categoriesResponse = await http.get(Uri.tryParse("$subCategoriesOnCategoryEndPoint/$categoryId/subcategories")!);
      if (categoriesResponse.statusCode == 200 || categoriesResponse.statusCode == 201) {
        final categoriesData = jsonDecode(categoriesResponse.body);
        _subCategoriesModel = SubCategoriesModel.fromJson(categoriesData);
        return _subCategoriesModel;
      } else {
        throw Exception("Categories Service Api Bad Request");
      }
    } on Exception catch (e) {
      log(e.toString(), name: "Categories Service Exception");
    }
    return null;
  }
}
