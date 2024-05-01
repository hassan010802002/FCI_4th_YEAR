// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:souqey/Screens/HomeScreen/Controller/home_controller_bloc.dart';
import 'package:souqey/Screens/HomeScreen/UI/Views/HomeView1/HomeStaggeredGridView/home_staggered_grid_view.dart';

class HomeView1 extends StatefulWidget {
  final HomeControllerBloc _homeController;

  const HomeView1({super.key, required final HomeControllerBloc homeController}) : _homeController = homeController;

  @override
  _HomeView1State createState() => _HomeView1State();
}

class _HomeView1State extends State<HomeView1> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        HomeStaggeredGridView(homeController: widget._homeController),
      ],
    );
  }
}
