// ignore_for_file: file_names

import 'dart:developer';

import 'package:injectable/injectable.dart';
import 'package:souqey/Injections/Base_Injection.dart';
import 'package:souqey/Models/AllProductsModel/AllProductsModel.dart';
import 'package:souqey/Screens/HomeScreen/Repository/BaseGetAllProductsRepository.dart';
import 'package:souqey/Screens/HomeScreen/Service/GetAllProductsService/GetAllProductsService.dart';

@injectable
class GetAllProductsRepository implements BaseGetAllProductsRepository {
  AllProductsModel? _productsModel;
  GetAllProductsService? _productsService;

  @override
  Future<AllProductsModel?>? getProducts() async {
    try {
      if (_productsService != null) {
        _productsModel = await _productsService!.getAllProducts();
        return _productsModel;
      } else {
        throw Exception("Products Service Repo Failure");
      }
    } on Exception catch (e) {
      log(e.toString(), name: "Products Repo Exception");
    }
    return null;
  }

  GetAllProductsRepository.productsRepo() {
    _productsService = get_Locator_it.get<GetAllProductsService>();
  }

  @factoryMethod
  factory GetAllProductsRepository() => GetAllProductsRepository.productsRepo();
}
