import 'package:flutter/material.dart';
import 'package:souqey/Screens/HomeScreen/Constants/HomeConsts.dart';
import 'package:souqey/Screens/HomeScreen/Controller/home_controller_bloc.dart';

class ProductBrandWidget extends StatefulWidget {
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
  _ProductBrandWidgetState createState() => _ProductBrandWidgetState();
}

class _ProductBrandWidgetState extends State<ProductBrandWidget> {
  @override
  Widget build(BuildContext context) {
    return Text(
      widget._homeController.productsFilterData!
          .elementAt(widget._categoryViewIdx)
          .values
          .elementAt(0)
          .elementAt(widget._productViewIdx)
          .brand!
          .name!,
      softWrap: true,
      textAlign: TextAlign.start,
      style: HomeConsts.style4(context),
    );
  }
}
