import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:souqey/Screens/HomeScreen/Controller/home_controller_bloc.dart';
import 'package:souqey/Screens/HomeScreen/UI/Widgets/ProductBrandWidget/product_brand_widget.dart';
import 'package:souqey/Screens/HomeScreen/UI/Widgets/ProductCoverImage/product_cover_image.dart';
import 'package:souqey/Screens/HomeScreen/UI/Widgets/ProductPriceWidget/product_price_widget.dart';
import 'package:souqey/Screens/HomeScreen/UI/Widgets/ProductTitleWidget/product_title_widget.dart';
import 'package:souqey/Screens/HomeScreen/UI/Widgets/RattingDetailsWidget/ratting_details_widget.dart';

class CategoryProductView extends StatelessWidget {
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
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ProductCoverImage(
          homeController: _homeController,
          categoryViewIdx: _categoryViewIdx,
          productViewIdx: _productViewIdx,
        ),
        SizedBox(
          height: 20.0.h,
        ),
        RattingDetailsWidget(
          homeController: _homeController,
          categoryViewIdx: _categoryViewIdx,
          productViewIdx: _productViewIdx,
        ),
        ProductBrandWidget(
          homeController: _homeController,
          categoryViewIdx: _categoryViewIdx,
          productViewIdx: _productViewIdx,
        ),
        ProductTitleWidget(
          homeController: _homeController,
          categoryViewIdx: _categoryViewIdx,
          productViewIdx: _productViewIdx,
        ),
        ProductPriceWidget(
          homeController: _homeController,
          categoryViewIdx: _categoryViewIdx,
          productViewIdx: _productViewIdx,
        ),
      ],
    );
  }
}
