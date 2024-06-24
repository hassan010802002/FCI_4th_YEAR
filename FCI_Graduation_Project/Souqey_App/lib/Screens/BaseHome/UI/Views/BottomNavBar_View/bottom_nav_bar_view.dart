// ignore_for_file: library_private_types_in_public_api, must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:souqey/Helpers/Size_Helper/MediaQuery_Size_Helper.dart';
import 'package:souqey/Screens/BaseHome/Constants/BaseHomeConsts.dart';
import 'package:souqey/Screens/BaseHome/Controller/base_cubit.dart';
import 'package:souqey/Screens/BaseHome/UI/Widgets/BagNavBar_Item/bag_nav_bar_item.dart';
import 'package:souqey/Screens/BaseHome/UI/Widgets/FavNavBar_Item/fav_nav_bar_item.dart';
import 'package:souqey/Screens/BaseHome/UI/Widgets/HomeNavBar_Item/home_nav_bar_item.dart';
import 'package:souqey/Screens/BaseHome/UI/Widgets/ProfileNavBar_Item/profile_nav_bar_item.dart';
import 'package:souqey/Screens/BaseHome/UI/Widgets/ShopNavBar_Item/shop_nav_bar_item.dart';

class BottomNavBarView extends StatelessWidget {
  final BaseCubit cubit;

  const BottomNavBarView({super.key, required this.cubit});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BaseCubit, BaseState>(
      bloc: cubit,
      builder: (context, state) {
        return BottomNavigationBar(
          elevation: 0.0,
          items: [
            BottomNavigationBarItem(
              icon: HomeNavBarItem(cubit: cubit),
              label: BaseHomeConsts.text1,
            ),
            BottomNavigationBarItem(
              icon: ShopNavBarItem(cubit: cubit),
              label: BaseHomeConsts.text2,
            ),
            BottomNavigationBarItem(
              icon: BagNavBarItem(cubit: cubit),
              label: BaseHomeConsts.text3,
            ),
            BottomNavigationBarItem(
              icon: FavNavBarItem(cubit: cubit),
              label: BaseHomeConsts.text4,
            ),
            BottomNavigationBarItem(
              icon: ProfileNavBarItem(cubit: cubit),
              label: BaseHomeConsts.text5,
            ),
          ],
          backgroundColor: BaseHomeConsts.color9,
          currentIndex: cubit.baseIndex!,
          selectedItemColor: BaseHomeConsts.color6,
          unselectedItemColor: BaseHomeConsts.color8,
          selectedFontSize: MediaQuery_Size_Helper.MAX_WIDTH(context)! / 26.0.sp,
          unselectedFontSize: MediaQuery_Size_Helper.MAX_WIDTH(context)! / 26.0.sp,
          onTap: (value) {
            cubit.ChangeBase(context, value);
          },
          iconSize: 50.0.sp,
          unselectedLabelStyle: BaseHomeConsts.textStyle1(context),
          selectedLabelStyle: BaseHomeConsts.textStyle2(context),
          showSelectedLabels: true,
          showUnselectedLabels: true,
          type: BottomNavigationBarType.shifting,
        );
      },
    );
  }
}
