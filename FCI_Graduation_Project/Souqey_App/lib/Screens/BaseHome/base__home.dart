// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:souqey/Injections/Base_Injection.dart';
import 'package:souqey/Screens/BaseHome/Controller/base_cubit.dart';
import 'package:souqey/Screens/BaseHome/UI/Views/BottomNavBar_View/bottom_nav_bar_view.dart';

class BaseHome extends StatefulWidget {
  int? baseIndex;

  BaseHome({super.key, required this.baseIndex});

  @override
  State<BaseHome> createState() => _BaseHomeState();
}

class _BaseHomeState extends State<BaseHome> {
  BaseCubit? cubit;
  @override
  void initState() {
    cubit = get_Locator_it.get<BaseCubit>(param1: widget.baseIndex!);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => cubit!,
      child: BottomNavBarView(cubit: cubit!),
    );
  }
}
