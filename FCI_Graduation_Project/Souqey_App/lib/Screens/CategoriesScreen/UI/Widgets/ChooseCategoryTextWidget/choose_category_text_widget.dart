import 'package:flutter/material.dart';
import 'package:souqey/Screens/CategoriesScreen/Constants/CategoriesConsts.dart';

class ChooseCategoryTextWidget extends StatelessWidget {
  const ChooseCategoryTextWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      CategoriesConsts.categoriesChooseCategoryText,
      softWrap: true,
      textAlign: TextAlign.start,
      style: CategoriesConsts.textStyle6(context),
    );
  }
}
