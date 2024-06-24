import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:souqey/Components/Custom_Button/Custom_Button.dart';
import 'package:souqey/Helpers/Size_Helper/MediaQuery_Size_Helper.dart';
import 'package:souqey/Screens/CategoriesScreen/Constants/CategoriesConsts.dart';
import 'package:souqey/Screens/CategoriesScreen/Controller/categories_controller_bloc.dart';

class ViewAllCategoryProductsButton extends StatelessWidget {
  final CategoriesControllerBloc _categoriesController;
  const ViewAllCategoryProductsButton({
    super.key,
    required final CategoriesControllerBloc categoriesController,
  }) : _categoriesController = categoriesController;

  @override
  Widget build(BuildContext context) {
    return CustomButton(
      onPressed: () {
        _categoriesController.changeCategoryView();
      },
      backgroundColor: MaterialStatePropertyAll(CategoriesConsts.color3),
      shape: MaterialStatePropertyAll(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0.sp),
        ),
      ),
      buttonText: CategoriesConsts.categoriesViewAllItemsButtonText,
      fixedSize: MaterialStatePropertyAll(
        Size(
          MediaQuery_Size_Helper.MAX_WIDTH(context)!,
          MediaQuery_Size_Helper.MAX_HEIGHT(context)! / 16.5.h,
        ),
      ),
      style: CategoriesConsts.textStyle5(context),
    );
  }
}
