import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:souqey/Screens/CategoriesScreen/Controller/categories_controller_bloc.dart';
import 'package:souqey/Screens/CategoriesScreen/UI/Views/CategoriesView2/SubCategoriesListView/sub_categories_list_view.dart';
import 'package:souqey/Screens/CategoriesScreen/UI/Widgets/ChooseCategoryTextWidget/choose_category_text_widget.dart';
import 'package:souqey/Screens/CategoriesScreen/UI/Widgets/ViewAllCategoryProductsButton/view_all_category_products_button.dart';

class CategoriesView2 extends StatelessWidget {
  final CategoriesControllerBloc _categoriesController;

  const CategoriesView2({
    super.key,
    required final CategoriesControllerBloc categoriesController,
  }) : _categoriesController = categoriesController;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const ViewAllCategoryProductsButton(),
        SizedBox(
          height: 20.0.h,
        ),
        const ChooseCategoryTextWidget(),
        SizedBox(
          height: 20.0.h,
        ),
        SubCategoriesListView(
          categoriesController: _categoriesController,
        )
      ],
    );
  }
}
