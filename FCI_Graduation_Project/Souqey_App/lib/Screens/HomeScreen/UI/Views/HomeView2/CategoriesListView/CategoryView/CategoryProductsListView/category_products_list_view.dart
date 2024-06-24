import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:souqey/Screens/HomeScreen/Controller/home_controller_bloc.dart';
import 'package:souqey/Screens/HomeScreen/UI/Views/HomeView2/CategoriesListView/CategoryView/CategoryProductsListView/CategoryProductView/category_product_view.dart';

class CategoryProductsListView extends StatelessWidget {
  final HomeControllerBloc _homeController;
  final int _categoryViewIdx;

  const CategoryProductsListView({super.key, required HomeControllerBloc homeController, required int categoryViewIdx})
      : _homeController = homeController,
        _categoryViewIdx = categoryViewIdx;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      primary: true,
      shrinkWrap: true,
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, productIdx) => CategoryProductView(
        homeController: _homeController,
        categoryViewIdx: _categoryViewIdx,
        productViewIdx: productIdx,
      ),
      itemCount: _homeController.productsFilterData!.elementAt(_categoryViewIdx).values.elementAt(0).length,
      separatorBuilder: (BuildContext context, int index) {
        return SizedBox(
          width: 20.0.w,
        );
      },
    );
  }
}
