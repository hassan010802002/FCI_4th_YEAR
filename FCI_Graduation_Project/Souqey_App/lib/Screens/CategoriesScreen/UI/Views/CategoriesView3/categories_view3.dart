import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:souqey/Screens/CategoriesScreen/Constants/CategoriesConsts.dart';
import 'package:souqey/Screens/CategoriesScreen/Controller/categories_controller_bloc.dart';

class CategoriesView3 extends StatelessWidget {
  final CategoriesControllerBloc _categoriesController;

  const CategoriesView3({
    super.key,
    required final CategoriesControllerBloc categoriesController,
  }) : _categoriesController = categoriesController;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListView.separated(
          itemCount: 5,
          itemBuilder: (BuildContext context, int index) {
            return Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: CategoriesConsts.color2,
                borderRadius: BorderRadius.circular(30.0.sp),
              ),
              child: Center(
                child: Text('text'),
              ),
            );
          },
          separatorBuilder: (BuildContext context, int index) => SizedBox(
            width: 12.0.w,
          ),
        ),
      ],
    );
  }
}
