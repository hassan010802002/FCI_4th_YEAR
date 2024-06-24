import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:souqey/Components/CustomBackButton/CustomBackButton.dart';
import 'package:souqey/Helpers/Size_Helper/MediaQuery_Size_Helper.dart';
import 'package:souqey/Screens/CategoriesScreen/Constants/CategoriesConsts.dart';
import 'package:souqey/Screens/CategoriesScreen/Controller/categories_controller_bloc.dart';
import 'package:souqey/Screens/CategoriesScreen/UI/Widgets/AppBarWidgets/AppBarSearchIcon/app_bar_search_icon.dart';

class ScreenAppBarView extends AppBar {
  final CategoriesControllerBloc _categoriesController;

  ScreenAppBarView({
    super.key,
    required final CategoriesControllerBloc categoriesController,
  }) : _categoriesController = categoriesController;

  @override
  _ScreenAppBarViewState createState() => _ScreenAppBarViewState();
}

class _ScreenAppBarViewState extends State<ScreenAppBarView> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      primary: true,
      backgroundColor: CategoriesConsts.color1,
      centerTitle: true,
      elevation: 15.0.sp,
      toolbarHeight: MediaQuery_Size_Helper.MAX_HEIGHT(context)! / 8.0.h,
      title: BlocSelector<CategoriesControllerBloc, CategoriesControllerState, int>(
        bloc: widget._categoriesController,
        selector: (state) {
          return widget._categoriesController.categoryViews;
        },
        builder: (context, state) {
          return Text(
            state == 2
                ? widget._categoriesController.categoriesModel!.data!.elementAt(widget._categoriesController.activeCategoryIdx!).name!
                : CategoriesConsts.categoriesAppBarTitle,
          );
        },
      ),
      titleTextStyle: CategoriesConsts.appBarTitleStyle(context),
      leading: CustomBackButton(
        onPressed: widget._categoriesController.changeCategoryViewBackWord,
      ),
      leadingWidth: 60.0.w,
      actions: const [
        AppBarSearchIcon(),
      ],
    );
  }
}
