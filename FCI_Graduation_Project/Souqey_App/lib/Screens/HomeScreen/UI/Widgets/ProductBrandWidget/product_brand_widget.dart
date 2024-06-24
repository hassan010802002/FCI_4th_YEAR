import 'package:flutter/material.dart';
import 'package:souqey/Screens/HomeScreen/Constants/HomeConsts.dart';
import 'package:souqey/Screens/HomeScreen/Controller/home_controller_bloc.dart';

class ProductBrandWidget extends StatelessWidget {
  final HomeControllerBloc _homeController;
  final int _categoryViewIdx;
  final int _productViewIdx;

  const ProductBrandWidget({
    super.key,
    required HomeControllerBloc homeController,
    required int categoryViewIdx,
    required int productViewIdx,
  })  : _homeController = homeController,
        _categoryViewIdx = categoryViewIdx,
        _productViewIdx = productViewIdx;

  @override
  Widget build(BuildContext context) {
    return Text(
      _homeController.productsFilterData!.elementAt(_categoryViewIdx).values.elementAt(0).elementAt(_productViewIdx).brand!.name!,
      softWrap: true,
      textAlign: TextAlign.start,
      style: HomeConsts.style4(context),
    );
  }
}
