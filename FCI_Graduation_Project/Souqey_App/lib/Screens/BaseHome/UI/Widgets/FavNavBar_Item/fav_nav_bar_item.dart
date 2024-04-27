// ignore_for_file: library_private_types_in_public_api, must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:souqey/Screens/BaseHome/Constants/BaseHomeConsts.dart';

import '../../../Controller/base_cubit.dart';

class FavNavBarItem extends StatefulWidget {
  BaseCubit cubit;

  FavNavBarItem({super.key, required this.cubit});

  @override
  _FavNavBarItemState createState() => _FavNavBarItemState();
}

class _FavNavBarItemState extends State<FavNavBarItem> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BaseCubit, BaseState>(
      bloc: widget.cubit,
      builder: (context, state) {
        return SvgPicture.asset(
          state is FavoritesBase ? BaseHomeConsts.image7 : BaseHomeConsts.image8,
          fit: BoxFit.contain,
          alignment: Alignment.center,
          height: 35.0.h,
          width: 35.0.w,
        );
      },
    );
  }
}
