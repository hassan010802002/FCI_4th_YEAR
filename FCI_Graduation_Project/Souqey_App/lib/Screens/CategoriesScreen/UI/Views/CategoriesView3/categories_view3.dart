import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:souqey/Helpers/Size_Helper/MediaQuery_Size_Helper.dart';
import 'package:souqey/Screens/CategoriesScreen/Controller/categories_controller_bloc.dart';
import 'package:souqey/Screens/CategoriesScreen/UI/Views/CategoriesView3/ProductsFilterView/products_filter_view.dart';
import 'package:souqey/Screens/CategoriesScreen/UI/Views/CategoriesView3/ProductsOnCategoryView/products_on_category_view.dart';
import 'package:souqey/Screens/CategoriesScreen/UI/Views/CategoriesView3/SubCategoriesListView/sub_categories_list_view.dart';

class CategoriesView3 extends StatefulWidget {
  final CategoriesControllerBloc _categoriesController;

  const CategoriesView3({
    super.key,
    required final CategoriesControllerBloc categoriesController,
  }) : _categoriesController = categoriesController;

  @override
  State<CategoriesView3> createState() => _CategoriesView3State();
}

class _CategoriesView3State extends State<CategoriesView3> {
  @override
  void initState() {
    widget._categoriesController.add(
      CategoriesGetAllProductsOnCategoryEvent(
          categoryId: widget._categoriesController.categoriesModel!.data!.elementAt(widget._categoriesController.activeCategoryIdx!).id),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        BlocSelector<CategoriesControllerBloc, CategoriesControllerState, int>(
          selector: (state) {
            return widget._categoriesController.categoryViews;
          },
          builder: (context, state) {
            return state == 2
                ? SizedBox(
                    height: MediaQuery_Size_Helper.MAX_HEIGHT(context)! / 20.0.h,
                    child: SubCategoriesListView(
                      categoriesController: widget._categoriesController,
                    ))
                : const SizedBox();
          },
        ),
        SizedBox(
          height: 20.0.h,
        ),
        ProductsFilterView(categoriesController: widget._categoriesController),
        SizedBox(
          height: 20.0.h,
        ),
        BlocSelector<CategoriesControllerBloc, CategoriesControllerState, bool>(
          bloc: widget._categoriesController,
          selector: (state) {
            return widget._categoriesController.isSuccessProductsOnCategoryService;
          },
          builder: (context, state) {
            return BlocSelector<CategoriesControllerBloc, CategoriesControllerState, bool>(
              selector: (state) {
                return widget._categoriesController.isMultiLayoutView;
              },
              builder: (context, layout) {
                return Expanded(
                  child: ProductsOnCategoryView(
                    categoriesController: widget._categoriesController,
                    state: state,
                    layout: layout,
                  ),
                );
              },
            );
          },
        )
      ],
    );
  }
}
