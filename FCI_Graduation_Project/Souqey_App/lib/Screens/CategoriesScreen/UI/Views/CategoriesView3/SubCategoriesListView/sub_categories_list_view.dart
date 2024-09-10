import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:souqey/Config/AppConfigs.dart';
import 'package:souqey/Helpers/Size_Helper/MediaQuery_Size_Helper.dart';
import 'package:souqey/Screens/CategoriesScreen/Constants/CategoriesConsts.dart';
import 'package:souqey/Screens/CategoriesScreen/Controller/categories_controller_bloc.dart';

class SubCategoriesListView extends StatelessWidget {
  final CategoriesControllerBloc _categoriesController;

  const SubCategoriesListView({
    super.key,
    required final CategoriesControllerBloc categoriesController,
  }) : _categoriesController = categoriesController;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      primary: true,
      keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
      scrollDirection: Axis.horizontal,
      itemCount: _categoriesController.subCategoriesModel!.results!.toInt(),
      itemBuilder: (BuildContext context, int index) {
        return Container(
          padding: EdgeInsets.symmetric(horizontal: 20.0.w, vertical: 8.0.h),
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: CategoriesConsts.color2,
            borderRadius: BorderRadius.circular(30.0.sp),
          ),
          child: Center(
            child: Text(
              _categoriesController.subCategoriesModel!.data!.elementAt(index).name!,
              softWrap: true,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: CategoriesConsts.color1,
                fontFamily: TextFontFamily,
                fontWeight: FontWeight.w600,
                fontSize: MediaQuery_Size_Helper.MAX_WIDTH(context)! / 24.0.sp,
              ),
            ),
          ),
        );
      },
      separatorBuilder: (BuildContext context, int index) => SizedBox(
        width: 12.0.w,
      ),
    );
  }
}
