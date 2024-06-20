import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:souqey/Screens/HomeScreen/Constants/HomeConsts.dart';
import 'package:souqey/Screens/HomeScreen/Controller/home_controller_bloc.dart';

class ProductPriceWidget extends StatefulWidget {
  final HomeControllerBloc _homeController;
  final int _categoryViewIdx;
  final int _productViewIdx;

  const ProductPriceWidget({
    super.key,
    required HomeControllerBloc homeController,
    required int categoryViewIdx,
    required int productViewIdx,
  })  : _homeController = homeController,
        _categoryViewIdx = categoryViewIdx,
        _productViewIdx = productViewIdx;

  @override
  _ProductPriceWidgetState createState() => _ProductPriceWidgetState();
}

class _ProductPriceWidgetState extends State<ProductPriceWidget> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          "${widget._homeController.productsFilterData!.elementAt(widget._categoryViewIdx).values.elementAt(0).elementAt(widget._productViewIdx).price!.ceil() + (widget._homeController.productsFilterData!.elementAt(widget._categoryViewIdx).values.elementAt(0).elementAt(widget._productViewIdx).price!.ceil() * 0.2).ceil()}\$",
          softWrap: true,
          textAlign: TextAlign.justify,
          maxLines: 2,
          style: HomeConsts.style6(context),
        ),
        SizedBox(
          width: 8.0.w,
        ),
        Text(
          "${widget._homeController.productsFilterData!.elementAt(widget._categoryViewIdx).values.elementAt(0).elementAt(widget._productViewIdx).price!.ceil()}\$",
          softWrap: true,
          textAlign: TextAlign.justify,
          maxLines: 2,
          style: HomeConsts.style8(context),
        ),
      ],
    );
  }
}
