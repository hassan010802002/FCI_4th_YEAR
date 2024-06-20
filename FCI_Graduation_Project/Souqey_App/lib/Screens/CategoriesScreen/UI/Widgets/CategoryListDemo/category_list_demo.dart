import 'package:animate_do/animate_do.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:octo_image/octo_image.dart';
import 'package:souqey/Helpers/Size_Helper/MediaQuery_Size_Helper.dart';
import 'package:souqey/Screens/CategoriesScreen/Constants/CategoriesConsts.dart';
import 'package:souqey/Screens/CategoriesScreen/Controller/categories_controller_bloc.dart';

class CategoryListDemo extends StatelessWidget {
  final CategoriesControllerBloc _categoriesController;
  final int? _categoryIdx;

  const CategoryListDemo({
    super.key,
    required final CategoriesControllerBloc categoriesController,
    required int? categoryIdx,
  })  : _categoriesController = categoriesController,
        _categoryIdx = categoryIdx;

  @override
  Widget build(BuildContext context) {
    return FadeOutRightBig(
      curve: Curves.bounceIn,
      duration: const Duration(microseconds: 500),
      child: GestureDetector(
        onTap: () {
          _categoriesController.activeCategoryIdx = _categoryIdx;
          _categoriesController
              .add(CategoriesGetSubCategoriesEvent(categoryId: _categoriesController.categoriesModel!.data!.elementAt(_categoryIdx).id));
          _categoriesController.changeCategoryView();
        },
        child: Container(
          alignment: Alignment.center,
          decoration: CategoriesConsts.containerStyle1(),
          constraints: BoxConstraints.expand(
            height: MediaQuery_Size_Helper.MAX_HEIGHT(context)! / 7.0.h,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: EdgeInsets.only(left: 20.0.w),
                child: Text(
                  _categoriesController.categoriesModel!.data!.elementAt(_categoryIdx!).name!,
                  softWrap: true,
                  textAlign: TextAlign.start,
                  style: CategoriesConsts.textStyle3(context),
                ),
              ),
              OctoImage(
                image: CachedNetworkImageProvider(_categoriesController.categoriesModel!.data!.elementAt(_categoryIdx).image!),
                alignment: Alignment.center,
                height: MediaQuery_Size_Helper.MAX_HEIGHT(context)!,
                width: MediaQuery_Size_Helper.MAX_WIDTH(context)! / 2.2.w,
                fadeInCurve: Curves.easeInCubic,
                fadeInDuration: const Duration(milliseconds: 300),
                filterQuality: FilterQuality.high,
                fit: BoxFit.cover,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
