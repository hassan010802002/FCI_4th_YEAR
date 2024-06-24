import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:souqey/Screens/HomeScreen/Controller/home_controller_bloc.dart';
import 'package:souqey/Screens/HomeScreen/UI/Views/HomeView2/CategoriesListView/CategoryView/category_view.dart';

class CategoriesListView extends StatelessWidget {
  final HomeControllerBloc _homeController;
  const CategoriesListView({super.key, required HomeControllerBloc homeController}) : _homeController = homeController;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: _homeController.productsFilterData!.length,
      primary: true,
      shrinkWrap: true,
      itemBuilder: (context, index) => CategoryView(homeController: _homeController, categoryViewIdx: index),
      separatorBuilder: (BuildContext context, int index) {
        return SizedBox(
          height: 20.0.w,
        );
      },
    );
  }
}
