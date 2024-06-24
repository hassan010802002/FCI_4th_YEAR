// ignore_for_file: library_private_types_in_public_api

import 'package:animate_do/animate_do.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:souqey/Helpers/Size_Helper/MediaQuery_Size_Helper.dart';
import 'package:souqey/Screens/HomeScreen/Controller/home_controller_bloc.dart';

class HomeStaggeredGridImageTileWidget extends StatelessWidget {
  final HomeControllerBloc _homeController;
  final int crossAxisCellCount;
  final int mainAxisCellCount;

  const HomeStaggeredGridImageTileWidget({
    super.key,
    required final HomeControllerBloc homeController,
    required this.crossAxisCellCount,
    required this.mainAxisCellCount,
  }) : _homeController = homeController;

  @override
  Widget build(BuildContext context) {
    return StaggeredGridTile.count(
      crossAxisCellCount: crossAxisCellCount,
      mainAxisCellCount: mainAxisCellCount,
      child: BlocBuilder<HomeControllerBloc, HomeControllerState>(
        bloc: _homeController,
        builder: (context, state) {
          return !_homeController.isImageSwitching
              ? FadeInLeft(
                  duration: const Duration(milliseconds: 500),
                  onFinish: (direction) {
                    _homeController.switchingCurrentImage();
                  },
                  child: Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.zero,
                    child: CachedNetworkImage(
                      fit: BoxFit.cover,
                      alignment: Alignment.center,
                      filterQuality: FilterQuality.high,
                      height: MediaQuery_Size_Helper.MAX_HEIGHT(context)!.h,
                      width: MediaQuery_Size_Helper.MAX_WIDTH(context)!.w,
                      imageUrl: _homeController.categoriesModel!.data!
                          .elementAt(
                            _homeController.activeCurrentIndex!,
                          )
                          .image!,
                    ),
                  ),
                )
              : const SizedBox();
        },
      ),
    );
  }
}
