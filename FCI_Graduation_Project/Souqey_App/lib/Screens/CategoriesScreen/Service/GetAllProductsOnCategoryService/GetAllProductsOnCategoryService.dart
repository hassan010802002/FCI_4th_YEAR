import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:injectable/injectable.dart';
import 'package:souqey/Config/AppConfigs.dart';
import 'package:souqey/Models/AllProductsModel/AllProductsModel.dart';

@injectable
class GetAllProductsOnCategoryService {
  AllProductsModel? _productsOnCategoryModel;

  Future<AllProductsModel?>? getAllProductsOnCategory({required String? categoryId}) async {
    try {
      final http.Response productsResponse = await http.get(Uri.tryParse(productsOnCategoryEndPoint + categoryId!)!);
      if (productsResponse.statusCode == 200 || productsResponse.statusCode == 201) {
        final productsData = jsonDecode(productsResponse.body);
        _productsOnCategoryModel = AllProductsModel.fromJson(productsData);
        return _productsOnCategoryModel;
      } else {
        throw Exception("Products on Category Service Api Bad Request");
      }
    } on Exception catch (e) {
      log(e.toString(), name: "Products on Category Service Exception");
    }
    return null;
  }
}
