// ignore_for_file: camel_case_types, must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:souqey/Screens/CategoriesScreen/Controller/categories_controller_bloc.dart';
import 'package:souqey/Screens/CategoriesScreen/UI/Views/CategoriesView1/categories_view1.dart';
import 'package:souqey/Screens/CategoriesScreen/UI/Views/CategoriesView2/categories_view2.dart';

class CategoriesMainView extends StatelessWidget {
  final CategoriesControllerBloc _categoriesController;

  const CategoriesMainView({
    super.key,
    required final CategoriesControllerBloc categoriesController,
  }) : _categoriesController = categoriesController;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topCenter,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15.0.w, vertical: 20.0.h),
        child: BlocSelector<CategoriesControllerBloc, CategoriesControllerState, int>(
          bloc: _categoriesController,
          selector: (state) {
            return _categoriesController.categoryViews;
          },
          builder: (context, state) {
            return state == 0
                ? CategoriesView1(
                    categoriesController: _categoriesController,
                  )
                : state == 1
                    ? CategoriesView2(
                        categoriesController: _categoriesController,
                      )
                    : const SizedBox();
          },
        ),
      ),
    );
  }
}
