import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:souqey/Helpers/Size_Helper/MediaQuery_Size_Helper.dart';
import 'package:souqey/Screens/HomeScreen/Constants/HomeConsts.dart';
import 'package:souqey/Screens/HomeScreen/Controller/home_controller_bloc.dart';
import 'package:souqey/Screens/HomeScreen/UI/Views/HomeView2/CategoriesListView/categories_list_view.dart';

class HomeView3 extends StatefulWidget {
  final HomeControllerBloc _homeController;

  const HomeView3({super.key, required final HomeControllerBloc homeController}) : _homeController = homeController;

  @override
  _HomeView3State createState() => _HomeView3State();
}

class _HomeView3State extends State<HomeView3> {
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topCenter,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          BlocBuilder<HomeControllerBloc, HomeControllerState>(
            bloc: widget._homeController,
            builder: (context, state) {
              return !widget._homeController.isImageSwitching
                  ? FadeInDown(
                      duration: const Duration(milliseconds: 800),
                      onFinish: (direction) {
                        if (widget._homeController.isImageSwitching) {
                          widget._homeController.switchingCurrentImage();
                        }
                      },
                      child: Container(
                        decoration: HomeConsts.containerStyle1(context, widget._homeController),
                        padding: EdgeInsets.symmetric(
                          horizontal: 20.0.w,
                          vertical: 30.0.h,
                        ),
                        constraints: BoxConstraints.tight(
                          Size(
                            MediaQuery_Size_Helper.MAX_WIDTH(context)!.w,
                            MediaQuery_Size_Helper.MAX_HEIGHT(context)! / 3.5.h,
                          ),
                        ),
                        alignment: Alignment.bottomLeft,
                      ),
                    )
                  : const SizedBox();
            },
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 15.0.w, vertical: 20.0.h),
              child: CategoriesListView(homeController: widget._homeController),
            ),
          ),
        ],
      ),
    );
  }
}