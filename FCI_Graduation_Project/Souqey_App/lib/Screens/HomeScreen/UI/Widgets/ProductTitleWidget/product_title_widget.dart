import 'package:flutter/material.dart';
import 'package:souqey/Screens/HomeScreen/Constants/HomeConsts.dart';
import 'package:souqey/Screens/HomeScreen/Controller/home_controller_bloc.dart';

class ProductTitleWidget extends StatelessWidget {
  final HomeControllerBloc _homeController;
  final int _categoryViewIdx;
  final int _productViewIdx;

  const ProductTitleWidget({
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
      _homeController.productsFilterData!.elementAt(_categoryViewIdx).values.elementAt(0).elementAt(_productViewIdx).title!.length > 15
          ? "${_homeController.productsFilterData!.elementAt(_categoryViewIdx).values.elementAt(0).elementAt(_productViewIdx).title!.substring(0, 13)}..."
          : _homeController.productsFilterData!.elementAt(_categoryViewIdx).values.elementAt(0).elementAt(_productViewIdx).title!,
      softWrap: true,
      textAlign: TextAlign.justify,
      maxLines: 2,
      style: HomeConsts.style5(context),
    );
  }
}
