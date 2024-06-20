// ignore_for_file: file_names

import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:injectable/injectable.dart';
import 'package:souqey/Config/AppConfigs.dart';
import 'package:souqey/Models/AllProductsModel/AllProductsModel.dart';

@injectable
class GetAllProductsService {
  AllProductsModel? _productsModel;

  Future<AllProductsModel?>? getAllProducts() async {
    try {
      final http.Response productsResponse = await http.get(Uri.tryParse(productsEndPoint)!);
      if (productsResponse.statusCode == 200 || productsResponse.statusCode == 201) {
        final productsData = jsonDecode(productsResponse.body);
        _productsModel = AllProductsModel.fromJson(productsData);
        return _productsModel;
      } else {
        throw Exception("Products Service Api Bad Request");
      }
    } on Exception catch (e) {
      log(e.toString(), name: "Products Service Exception");
    }
    return null;
  }
}
