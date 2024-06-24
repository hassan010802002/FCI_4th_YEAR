// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:souqey/Screens/HomeScreen/Controller/home_controller_bloc.dart';
import 'package:souqey/Screens/HomeScreen/UI/Views/HomeView2/CategoriesListView/categories_list_view.dart';
import 'package:souqey/Screens/HomeScreen/UI/Widgets/HomeView2CategoriesContainerWidget/home_view2_categories_container_widget.dart';

class HomeView2 extends StatelessWidget {
  final HomeControllerBloc _homeController;

  const HomeView2({super.key, required final HomeControllerBloc homeController}) : _homeController = homeController;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topCenter,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          BlocBuilder<HomeControllerBloc, HomeControllerState>(
            bloc: _homeController,
            builder: (context, state) {
              return !_homeController.isImageSwitching
                  ? HomeView2CategoriesContainerWidget(
                      homeController: _homeController,
                    )
                  : const SizedBox();
            },
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 15.0.w, vertical: 20.0.h),
              child: CategoriesListView(homeController: _homeController),
            ),
          ),
        ],
      ),
    );
  }
}
