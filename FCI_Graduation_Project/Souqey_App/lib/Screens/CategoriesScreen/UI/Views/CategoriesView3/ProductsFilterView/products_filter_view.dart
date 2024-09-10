import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:souqey/Config/AppConfigs.dart';
import 'package:souqey/Helpers/Size_Helper/MediaQuery_Size_Helper.dart';
import 'package:souqey/Screens/CategoriesScreen/Constants/CategoriesConsts.dart';
import 'package:souqey/Screens/CategoriesScreen/Controller/categories_controller_bloc.dart';

class ProductsFilterView extends StatelessWidget {
  final CategoriesControllerBloc _categoriesController;

  const ProductsFilterView({
    super.key,
    required final CategoriesControllerBloc categoriesController,
  }) : _categoriesController = categoriesController;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.zero,
      decoration: const BoxDecoration(color: CategoriesConsts.color1),
      alignment: Alignment.center,
      constraints: BoxConstraints.expand(height: MediaQuery_Size_Helper.MAX_HEIGHT(context)! / 25.0.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          TextButton.icon(
            onPressed: () {},
            icon: const Icon(FontAwesomeIcons.filter),
            label: const Text('Filters'),
            style: ButtonStyle(
              textStyle: MaterialStatePropertyAll(
                TextStyle(
                  color: CategoriesConsts.color2,
                  fontSize: MediaQuery_Size_Helper.MAX_WIDTH(context)! / 26.0.sp,
                  fontWeight: FontWeight.w600,
                  fontFamily: TextFontFamily,
                ),
              ),
              backgroundColor: const MaterialStatePropertyAll(CategoriesConsts.transparentColor),
              alignment: Alignment.centerLeft,
              splashFactory: InkSparkle.splashFactory,
              iconColor: MaterialStatePropertyAll(CategoriesConsts.color2),
              iconSize: MaterialStatePropertyAll(22.0.sp),
              visualDensity: VisualDensity.adaptivePlatformDensity,
              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
              padding: MaterialStatePropertyAll(EdgeInsets.all(5.0.sp)),
            ),
          ),
          TextButton.icon(
            onPressed: () {},
            icon: const Icon(FontAwesomeIcons.sort),
            label: const Text('Sort-By'),
            style: ButtonStyle(
              textStyle: MaterialStatePropertyAll(
                TextStyle(
                  color: CategoriesConsts.color2,
                  fontSize: MediaQuery_Size_Helper.MAX_WIDTH(context)! / 26.0.sp,
                  fontWeight: FontWeight.w600,
                  fontFamily: TextFontFamily,
                ),
              ),
              backgroundColor: const MaterialStatePropertyAll(CategoriesConsts.transparentColor),
              alignment: Alignment.centerLeft,
              iconColor: MaterialStatePropertyAll(CategoriesConsts.color2),
              iconSize: MaterialStatePropertyAll(22.0.sp),
              visualDensity: VisualDensity.adaptivePlatformDensity,
              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
              padding: MaterialStatePropertyAll(EdgeInsets.symmetric(vertical: 5.0.h)),
            ),
          ),
          BlocSelector<CategoriesControllerBloc, CategoriesControllerState, bool>(
            bloc: _categoriesController,
            selector: (state) {
              return _categoriesController.isMultiLayoutView;
            },
            builder: (context, state) {
              return IconButton(
                onPressed: () {
                  _categoriesController.changeProductLayoutView();
                },
                icon: Icon(_categoriesController.isMultiLayoutView ? FontAwesomeIcons.grip : FontAwesomeIcons.list),
                style: ButtonStyle(
                  backgroundColor: const MaterialStatePropertyAll(CategoriesConsts.transparentColor),
                  alignment: Alignment.center,
                  iconColor: MaterialStatePropertyAll(CategoriesConsts.color2),
                  iconSize: MaterialStatePropertyAll(22.0.sp),
                  visualDensity: VisualDensity.adaptivePlatformDensity,
                  tapTargetSize: MaterialTapTargetSize.padded,
                  padding: MaterialStatePropertyAll(EdgeInsets.symmetric(vertical: 5.0.h)),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
