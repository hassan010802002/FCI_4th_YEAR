import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:souqey/Helpers/Size_Helper/MediaQuery_Size_Helper.dart';
import 'package:souqey/Screens/HomeScreen/Controller/home_controller_bloc.dart';
import 'package:souqey/Screens/HomeScreen/UI/Views/HomeView2/CategoriesListView/CategoryView/CategoryProductsListView/category_products_list_view.dart';
import 'package:souqey/Screens/HomeScreen/UI/Widgets/CategoryTitleWidget/category_title_widget.dart';
import 'package:souqey/Screens/HomeScreen/UI/Widgets/smallTextWidget/small_text_widget.dart';

class CategoryView extends StatefulWidget {
  final HomeControllerBloc _homeController;
  final int _categoryViewIdx;

  const CategoryView({super.key, required HomeControllerBloc homeController, required int categoryViewIdx})
      : _homeController = homeController,
        _categoryViewIdx = categoryViewIdx;

  @override
  _CategoryViewState createState() => _CategoryViewState();
}

class _CategoryViewState extends State<CategoryView> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CategoryTitleWidget(
          homeController: widget._homeController,
          categoryIdx: widget._categoryViewIdx,
        ),
        const SmallTextWidget(),
        SizedBox(
          height: 25.0.h,
        ),
        SizedBox(
          height: MediaQuery_Size_Helper.MAX_HEIGHT(context)! / 1.75.h,
          child: CategoryProductsListView(
            homeController: widget._homeController,
            categoryViewIdx: widget._categoryViewIdx,
          ),
        ),
      ],
    );
  }
}
