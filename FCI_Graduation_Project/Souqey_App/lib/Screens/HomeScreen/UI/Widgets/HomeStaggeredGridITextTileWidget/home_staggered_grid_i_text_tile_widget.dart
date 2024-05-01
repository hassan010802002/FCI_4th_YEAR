// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:souqey/Screens/HomeScreen/Constants/HomeConsts.dart';

class HomeStaggeredGridITextTileWidget extends StatefulWidget {
  const HomeStaggeredGridITextTileWidget({super.key});

  @override
  _HomeStaggeredGridITextTileWidgetState createState() => _HomeStaggeredGridITextTileWidgetState();
}

class _HomeStaggeredGridITextTileWidgetState extends State<HomeStaggeredGridITextTileWidget> {
  @override
  Widget build(BuildContext context) {
    return StaggeredGridTile.count(
      crossAxisCellCount: 1,
      mainAxisCellCount: 1,
      child: Center(
        child: Text(
          HomeConsts.homeStaggeredGridText,
          textAlign: TextAlign.start,
          style: HomeConsts.style7(context),
          softWrap: true,
        ),
      ),
    );
  }
}
