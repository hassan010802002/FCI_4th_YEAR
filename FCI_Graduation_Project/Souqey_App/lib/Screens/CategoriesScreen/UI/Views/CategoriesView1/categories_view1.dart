import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:souqey/Screens/CategoriesScreen/Controller/categories_controller_bloc.dart';
import 'package:souqey/Screens/CategoriesScreen/UI/Views/CategoriesView1/CategoriesListView/categories_list_view.dart';
import 'package:souqey/Screens/CategoriesScreen/UI/Widgets/CategoriesOfferContainer/categories_offer_container.dart';

class CategoriesView1 extends StatelessWidget {
  final CategoriesControllerBloc _categoriesController;

  const CategoriesView1({super.key, required final CategoriesControllerBloc categoriesController}) : _categoriesController = categoriesController;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const CategoriesOfferContainer(),
        SizedBox(
          height: 20.0.h,
        ),
        CategoriesListView(categoriesController: _categoriesController),
      ],
    );
  }
}
