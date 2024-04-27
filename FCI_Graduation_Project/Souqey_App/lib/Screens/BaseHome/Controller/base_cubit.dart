// ignore_for_file: non_constant_identifier_names

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:souqey/Helpers/Navigator_Helper/Navigator_Helper.dart';
import 'package:souqey/Routes/App_Routes.dart';

part 'base_state.dart';

@injectable
class BaseCubit extends Cubit<BaseState> {
  int? baseIndex;
  @factoryMethod
  BaseCubit([@factoryParam this.baseIndex = 0]) : super(HomeBase()) {
    if (baseIndex == 0) {
      emit(HomeBase());
    } else if (baseIndex == 1) {
      emit(ShopBase());
    } else if (baseIndex == 2) {
      emit(BagBase());
    } else if (baseIndex == 3) {
      emit(FavoritesBase());
    } else {
      emit(ProfileBase());
    }
  }

  void ChangeBase(BuildContext context, int index) {
    baseIndex = index;
    if (index == 0) {
      NavigatorHelper(context, AppRoutes.homeScreen);
      emit(HomeBase());
    } else if (index == 1) {
      // NavigatorHelper(context, AppRoutes.messagesScreen);
      emit(ShopBase());
    } else if (index == 2) {
      // NavigatorHelper(context, AppRoutes.appliedJobsScreen);
      emit(BagBase());
    } else if (index == 3) {
      // NavigatorHelper(context, AppRoutes.jobSavedScreen);
      emit(FavoritesBase());
    } else {
      // NavigatorHelper(context, AppRoutes.mainProfileScreen);
      emit(ProfileBase());
    }
  }
}
