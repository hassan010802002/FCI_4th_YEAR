// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:souqey/Injections/Base_Injection.dart';
import 'package:souqey/Screens/BaseHome/Controller/base_cubit.dart';
import 'package:souqey/Screens/BaseHome/base__home.dart';
import 'package:souqey/Screens/CategoriesScreen/Constants/CategoriesConsts.dart';
import 'package:souqey/Screens/CategoriesScreen/Controller/categories_controller_bloc.dart';
import 'package:souqey/Screens/CategoriesScreen/UI/Views/ScreenAppBarView/screen_app_bar_view.dart';
import 'package:souqey/Screens/CategoriesScreen/UI/Views/categories_main_view.dart';

class CategoriesScreen extends StatefulWidget {
  final int baseIndex;
  const CategoriesScreen({super.key, required this.baseIndex});

  @override
  State<CategoriesScreen> createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> {
  CategoriesControllerBloc? _categoriesController;
  BaseCubit? _baseController;

  @override
  void initState() {
    _categoriesController = get_Locator_it.get<CategoriesControllerBloc>();
    _baseController = get_Locator_it.get<BaseCubit>(param1: widget.baseIndex);
    _categoriesController!.add(CategoriesGetCategoriesEvent());
    _categoriesController!.add(CategoriesGetProductsEvent());
    super.initState();
  }

  @override
  void dispose() {
    _categoriesController!.close();
    _baseController!.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => _categoriesController!,
        ),
        BlocProvider(
          create: (context) => _baseController!,
        ),
      ],
      child: SafeArea(
        child: Scaffold(
          extendBody: true,
          primary: true,
          appBar: ScreenAppBarView(categoriesController: _categoriesController!),
          backgroundColor: CategoriesConsts.screenBackGroundColor,
          bottomNavigationBar: BaseHome(baseIndex: widget.baseIndex),
          body: CategoriesMainView(categoriesController: _categoriesController!),
        ),
      ),
    );
  }
}
