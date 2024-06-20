import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:souqey/Components/CustomLoadingPlaceholder/CustomLoadingPlaceholder.dart';
import 'package:souqey/Helpers/Size_Helper/MediaQuery_Size_Helper.dart';
import 'package:souqey/Screens/CategoriesScreen/Constants/CategoriesConsts.dart';
import 'package:souqey/Screens/CategoriesScreen/Controller/categories_controller_bloc.dart';
import 'package:souqey/Screens/CategoriesScreen/UI/Widgets/SubCategoryListTileDemo/sub_category_list_tile_demo.dart';

class SubCategoriesListView extends StatelessWidget {
  final CategoriesControllerBloc _categoriesController;

  const SubCategoriesListView({super.key, required final CategoriesControllerBloc categoriesController})
      : _categoriesController = categoriesController;

  @override
  Widget build(BuildContext context) {
    return BlocSelector<CategoriesControllerBloc, CategoriesControllerState, bool>(
      bloc: _categoriesController,
      selector: (state) {
        return _categoriesController.isSuccessSubCategoriesService;
      },
      builder: (context, state) {
        return Expanded(
          child: ListView.separated(
            itemBuilder: (context, index) {
              return state
                  ? SubCategoryListTileDemo(
                      categoriesController: _categoriesController,
                      subcategoryIdx: index,
                    )
                  : SizedBox(
                      width: MediaQuery_Size_Helper.MAX_WIDTH(context)!,
                      height: MediaQuery_Size_Helper.MAX_HEIGHT(context)! / 10.0.h,
                      child: const CustomLoadingPlaceholder(),
                    );
            },
            separatorBuilder: (context, index) {
              return Divider(
                color: CategoriesConsts.color4.withOpacity(0.6),
              );
            },
            itemCount: state ? _categoriesController.subCategoriesModel!.results!.toInt() : 8,
          ),
        );
      },
    );
  }
}
