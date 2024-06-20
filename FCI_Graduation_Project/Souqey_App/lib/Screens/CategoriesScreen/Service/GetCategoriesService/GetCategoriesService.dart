// ignore_for_file: file_names

import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:injectable/injectable.dart';
import 'package:souqey/Config/AppConfigs.dart';
import 'package:souqey/Models/CategoriesModel/CategoriesModel.dart';

@injectable
class GetCategoriesService {
  CategoriesModel? _categoriesModel;

  Future<CategoriesModel?>? getCategories() async {
    try {
      final http.Response categoriesResponse = await http.get(Uri.tryParse(categoriesEndPoint)!);
      if (categoriesResponse.statusCode == 200 || categoriesResponse.statusCode == 201) {
        final categoriesData = jsonDecode(categoriesResponse.body);
        _categoriesModel = CategoriesModel.fromJson(categoriesData);
        return _categoriesModel;
      } else {
        throw Exception("Categories Service Api Bad Request");
      }
    } on Exception catch (e) {
      log(e.toString(), name: "Categories Service Exception");
    }
    return null;
  }
}
