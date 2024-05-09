// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:souqey/Injections/Base_Injection.dart';
import 'package:souqey/Screens/BaseHome/Controller/base_cubit.dart';
import 'package:souqey/Screens/BaseHome/base__home.dart';
import 'package:souqey/Screens/HomeScreen/Constants/HomeConsts.dart';
import 'package:souqey/Screens/HomeScreen/Controller/home_controller_bloc.dart';
import 'package:souqey/Screens/HomeScreen/UI/Views/home_main_view.dart';

class HomeScreen extends StatefulWidget {
  final int baseIndex;
  const HomeScreen({super.key, required this.baseIndex});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  HomeControllerBloc? _homeController;
  BaseCubit? _baseController;

  @override
  void initState() {
    _homeController = get_Locator_it.get<HomeControllerBloc>();
    _baseController = get_Locator_it.get<BaseCubit>(param1: widget.baseIndex);
    _homeController!.add(HomeGetCategoriesEvent());
    _homeController!.add(HomeGetProductsEvent());
    super.initState();
  }

  @override
  void dispose() {
    _homeController!.close();
    _baseController!.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => _homeController!,
        ),
        BlocProvider(
          create: (context) => _baseController!,
        ),
      ],
      child: SafeArea(
        child: Scaffold(
          extendBody: true,
          primary: true,
          backgroundColor: HomeConsts.screenBackGroundColor,
          floatingActionButtonLocation: FloatingActionButtonLocation.miniEndFloat,
          bottomNavigationBar: BaseHome(baseIndex: widget.baseIndex),
          body: HomeMainView(homeController: _homeController!),
        ),
      ),
    );
  }
}
