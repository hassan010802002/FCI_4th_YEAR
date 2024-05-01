// ignore_for_file: file_names

import 'package:souqey/Models/AllProductsModel/AllProductsModel.dart';

abstract class BaseGetAllProductsRepository {
  Future<AllProductsModel?>? getProducts();
}
