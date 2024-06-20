import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:souqey/Screens/HomeScreen/Controller/home_controller_bloc.dart';
import 'package:souqey/Screens/HomeScreen/UI/Widgets/ProductBrandWidget/product_brand_widget.dart';
import 'package:souqey/Screens/HomeScreen/UI/Widgets/ProductCoverImage/product_cover_image.dart';
import 'package:souqey/Screens/HomeScreen/UI/Widgets/ProductPriceWidget/product_price_widget.dart';
import 'package:souqey/Screens/HomeScreen/UI/Widgets/ProductTitleWidget/product_title_widget.dart';
import 'package:souqey/Screens/HomeScreen/UI/Widgets/RattingDetailsWidget/ratting_details_widget.dart';

class CategoryProductView extends StatefulWidget {
  final HomeControllerBloc _homeController;
  final int _categoryViewIdx;
  final int _productViewIdx;

  const CategoryProductView({
    super.key,
    required HomeControllerBloc homeController,
    required int categoryViewIdx,
    required int productViewIdx,
  })  : _homeController = homeController,
        _categoryViewIdx = categoryViewIdx,
        _productViewIdx = productViewIdx;

  @override
  _CategoryProductViewState createState() => _CategoryProductViewState();
}

class _CategoryProductViewState extends State<CategoryProductView> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ProductCoverImage(
          homeController: widget._homeController,
          categoryViewIdx: widget._categoryViewIdx,
          productViewIdx: widget._productViewIdx,
        ),
        SizedBox(
          height: 20.0.h,
        ),
        RattingDetailsWidget(
          homeController: widget._homeController,
          categoryViewIdx: widget._categoryViewIdx,
          productViewIdx: widget._productViewIdx,
        ),
        ProductBrandWidget(
          homeController: widget._homeController,
          categoryViewIdx: widget._categoryViewIdx,
          productViewIdx: widget._productViewIdx,
        ),
        ProductTitleWidget(
          homeController: widget._homeController,
          categoryViewIdx: widget._categoryViewIdx,
          productViewIdx: widget._productViewIdx,
        ),
        ProductPriceWidget(
          homeController: widget._homeController,
          categoryViewIdx: widget._categoryViewIdx,
          productViewIdx: widget._productViewIdx,
        ),
      ],
    );
  }
}
