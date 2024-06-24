import 'package:flutter/material.dart';
import 'package:souqey/Screens/HomeScreen/Constants/HomeConsts.dart';
import 'package:souqey/Screens/HomeScreen/Controller/home_controller_bloc.dart';

class CategoryTitleWidget extends StatelessWidget {
  final int _categoryIdx;
  final HomeControllerBloc _homeController;

  const CategoryTitleWidget({super.key, required int categoryIdx, required HomeControllerBloc homeController})
      : _homeController = homeController,
        _categoryIdx = categoryIdx;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Text(
          _homeController.productsFilterData!.elementAt(_categoryIdx).keys.elementAt(0).name!,
          softWrap: true,
          textAlign: TextAlign.start,
          style: HomeConsts.style2(context),
        ),
        TextButton(
          onPressed: () {},
          style: HomeConsts.buttonStyle1(context),
          child: Text(
            HomeConsts.viewAllButtonText,
          ),
        )
      ],
    );
  }
}
