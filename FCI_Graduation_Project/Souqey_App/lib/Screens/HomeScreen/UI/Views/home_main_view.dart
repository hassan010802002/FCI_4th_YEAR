// ignore_for_file: camel_case_types, must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:souqey/Components/CustomLoadingPlaceholder/CustomLoadingPlaceholder.dart';
import 'package:souqey/Screens/HomeScreen/Controller/home_controller_bloc.dart';
import 'package:souqey/Screens/HomeScreen/UI/Views/HomeView1/home_view1.dart';
import 'package:souqey/Screens/HomeScreen/UI/Views/HomeView2/home_view2.dart';
import 'package:souqey/Screens/HomeScreen/UI/Views/HomeView3/home_view3.dart';

class HomeMainView extends StatefulWidget {
  final HomeControllerBloc _homeController;

  const HomeMainView({super.key, required final HomeControllerBloc homeController}) : _homeController = homeController;

  @override
  State<HomeMainView> createState() => _HomeMainViewState();
}

class _HomeMainViewState extends State<HomeMainView> {
  @override
  Widget build(BuildContext context) {
    return BlocSelector<HomeControllerBloc, HomeControllerState, bool>(
      bloc: widget._homeController,
      selector: (state) {
        if (widget._homeController.isSuccessProductsService && widget._homeController.isSuccessCategoriesService) {
          widget._homeController.productsFilter();
        }
        return widget._homeController.isSuccessProductsService && widget._homeController.isSuccessCategoriesService;
      },
      builder: (context, state) {
        return state
            ? GestureDetector(
                onVerticalDragStart: (details) {
                  widget._homeController.switchingCurrentView();
                },
                child: BlocSelector<HomeControllerBloc, HomeControllerState, int>(
                  selector: (state) {
                    return widget._homeController.activeCurrentView!;
                  },
                  builder: (context, state) {
                    return state == 0
                        ? HomeView1(homeController: widget._homeController)
                        : state == 1
                            ? HomeView2(homeController: widget._homeController)
                            : HomeView3(homeController: widget._homeController);
                  },
                ),
              )
            : const CustomLoadingPlaceholder();
      },
    );
  }
}
