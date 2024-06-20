import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:souqey/Components/CustomLoadingPlaceholder/CustomLoadingPlaceholder.dart';
import 'package:souqey/Helpers/Size_Helper/MediaQuery_Size_Helper.dart';
import 'package:souqey/Screens/CategoriesScreen/Controller/categories_controller_bloc.dart';
import 'package:souqey/Screens/CategoriesScreen/UI/Widgets/CategoryListDemo/category_list_demo.dart';

class CategoriesListView extends StatelessWidget {
  final CategoriesControllerBloc _categoriesController;

  const CategoriesListView({
    super.key,
    required final CategoriesControllerBloc categoriesController,
  }) : _categoriesController = categoriesController;

  @override
  Widget build(BuildContext context) {
    return BlocSelector<CategoriesControllerBloc, CategoriesControllerState, bool>(
      bloc: _categoriesController,
      selector: (state) {
        if (_categoriesController.isSuccessCategoriesService && _categoriesController.isSuccessProductsService) {}
        return _categoriesController.isSuccessCategoriesService && _categoriesController.isSuccessProductsService;
      },
      builder: (context, state) {
        return Expanded(
          child: ListView.separated(
            primary: true,
            shrinkWrap: true,
            itemCount: state ? _categoriesController.categoriesModel!.results!.toInt() : 10,
            itemBuilder: (BuildContext context, int index) {
              return state
                  ? CategoryListDemo(
                      categoriesController: _categoriesController,
                      categoryIdx: index,
                    )
                  : SizedBox(
                      height: MediaQuery_Size_Helper.MAX_HEIGHT(context)! / 7.0.h,
                      child: const CustomLoadingPlaceholder(),
                    );
            },
            separatorBuilder: (BuildContext context, int index) {
              return SizedBox(
                height: 20.0.h,
              );
            },
          ),
        );
      },
    );
  }
}
