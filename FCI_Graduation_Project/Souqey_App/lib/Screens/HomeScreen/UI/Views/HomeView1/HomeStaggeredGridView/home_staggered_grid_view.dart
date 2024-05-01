// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:souqey/Screens/HomeScreen/Controller/home_controller_bloc.dart';
import 'package:souqey/Screens/HomeScreen/UI/Widgets/HomeStaggeredGridITextTileWidget/home_staggered_grid_i_text_tile_widget.dart';
import 'package:souqey/Screens/HomeScreen/UI/Widgets/HomeStaggeredGridImageTileWidget/home_staggered_grid_image_tile_widget.dart';

class HomeStaggeredGridView extends StatefulWidget {
  final HomeControllerBloc _homeController;

  const HomeStaggeredGridView({super.key, required final HomeControllerBloc homeController}) : _homeController = homeController;

  @override
  _HomeStaggeredGridViewState createState() => _HomeStaggeredGridViewState();
}

class _HomeStaggeredGridViewState extends State<HomeStaggeredGridView> {
  @override
  Widget build(BuildContext context) {
    return StaggeredGrid.count(
      crossAxisCount: 2,
      children: [
        HomeStaggeredGridImageTileWidget(homeController: widget._homeController, crossAxisCellCount: 2, mainAxisCellCount: 2),
        const HomeStaggeredGridITextTileWidget(),
        HomeStaggeredGridImageTileWidget(homeController: widget._homeController, crossAxisCellCount: 1, mainAxisCellCount: 2),
        HomeStaggeredGridImageTileWidget(homeController: widget._homeController, crossAxisCellCount: 1, mainAxisCellCount: 1),
      ],
    );
  }
}
