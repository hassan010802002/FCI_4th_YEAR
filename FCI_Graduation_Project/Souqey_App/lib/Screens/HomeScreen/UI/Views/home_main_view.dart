// ignore_for_file: camel_case_types, must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:souqey/Components/CustomLoadingPlaceholder/CustomLoadingPlaceholder.dart';
import 'package:souqey/Screens/HomeScreen/Controller/home_controller_bloc.dart';
import 'package:souqey/Screens/HomeScreen/UI/Views/HomeView1/home_view1.dart';
import 'package:souqey/Screens/HomeScreen/UI/Views/HomeView2/home_view2.dart';
import 'package:souqey/Screens/HomeScreen/UI/Views/HomeView3/home_view3.dart';

class HomeMainView extends StatelessWidget {
  final HomeControllerBloc _homeController;

  const HomeMainView({super.key, required final HomeControllerBloc homeController}) : _homeController = homeController;

  @override
  Widget build(BuildContext context) {
    return BlocSelector<HomeControllerBloc, HomeControllerState, bool>(
      bloc: _homeController,
      selector: (state) {
        if (_homeController.isSuccessProductsService && _homeController.isSuccessCategoriesService) {
          _homeController.productsFilter();
        }
        return _homeController.isSuccessProductsService && _homeController.isSuccessCategoriesService;
      },
      builder: (context, state) {
        return state
            ? GestureDetector(
                onVerticalDragStart: (details) {
                  _homeController.switchingCurrentView();
                },
                child: BlocSelector<HomeControllerBloc, HomeControllerState, int>(
                  selector: (state) {
                    return _homeController.activeCurrentView!;
                  },
                  builder: (context, state) {
                    return state == 0
                        ? HomeView1(homeController: _homeController)
                        : state == 1
                            ? HomeView2(homeController: _homeController)
                            : HomeView3(homeController: _homeController);
                  },
                ),
              )
            : const CustomLoadingPlaceholder();
      },
    );
  }
}
