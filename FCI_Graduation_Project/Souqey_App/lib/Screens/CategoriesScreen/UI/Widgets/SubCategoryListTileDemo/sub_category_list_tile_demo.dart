import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:souqey/Screens/CategoriesScreen/Constants/CategoriesConsts.dart';
import 'package:souqey/Screens/CategoriesScreen/Controller/categories_controller_bloc.dart';

class SubCategoryListTileDemo extends StatelessWidget {
  final CategoriesControllerBloc _categoriesController;
  final int? _subCategoryIdx;

  const SubCategoryListTileDemo({
    super.key,
    required final CategoriesControllerBloc categoriesController,
    required final int? subcategoryIdx,
  })  : _categoriesController = categoriesController,
        _subCategoryIdx = subcategoryIdx;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      visualDensity: VisualDensity.adaptivePlatformDensity,
      contentPadding: EdgeInsets.symmetric(horizontal: 15.0.w),
      leadingAndTrailingTextStyle: CategoriesConsts.textStyle4(context),
      style: ListTileStyle.drawer,
      onTap: () {},
      leading: Text(
        _categoriesController.subCategoriesModel!.data!.elementAt(_subCategoryIdx!).name!,
      ),
    );
  }
}
