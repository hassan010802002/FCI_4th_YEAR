// ignore_for_file: invalid_use_of_visible_for_testing_member

import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:souqey/Injections/Base_Injection.dart';
import 'package:souqey/Models/CategoriesModel/CategoriesModel.dart';
import 'package:souqey/Screens/HomeScreen/Repository/GetCategoriesRepo/GetCategoriesRepo.dart';

part 'home_controller_event.dart';
part 'home_controller_state.dart';

@injectable
class HomeControllerBloc extends Bloc<HomeControllerEvent, HomeControllerState> {
  bool isSuccessCategoriesService = false;
  bool isSuccessImageSwitching = false;
  CategoriesModel? categoriesModel;
  GetCategoriesRepo? _categoriesRepo;
  int? activeCurrentIndex;

  HomeControllerBloc() : super(HomeControllerInitial()) {
    activeCurrentIndex = 0;
    _categoriesRepo = get_Locator_it.get<GetCategoriesRepo>();

    on<HomeGetCategoriesEvent>((event, emit) async {
      isSuccessCategoriesService = false;
      emit(HomeGetCategoriesState(
        categoriesModel: CategoriesModel(),
        state: CategoriesStates.loading,
      ).copyWith());
      try {
        if (_categoriesRepo != null) {
          categoriesModel = await _categoriesRepo!.getCategories();
          isSuccessCategoriesService = true;
          emit(HomeGetCategoriesState(
            categoriesModel: categoriesModel,
            state: CategoriesStates.success,
          ).copyWith());
        } else {
          isSuccessCategoriesService = false;
          emit(HomeGetCategoriesState(
            categoriesModel: CategoriesModel(),
            state: CategoriesStates.failure,
          ).copyWith());
          throw Exception("Categories Controller Failure");
        }
      } on Exception catch (e) {
        isSuccessCategoriesService = false;
        log(e.toString(), name: "Categories Controller Exception");
        emit(HomeGetCategoriesState(
          categoriesModel: CategoriesModel(),
          state: CategoriesStates.failure,
        ).copyWith());
      }
    });
  }

  void switchingCurrentImage() {
    if (isSuccessCategoriesService) {
      Timer.periodic(
        const Duration(seconds: 3),
        (timer) {
          isSuccessImageSwitching = false;
          emit(const HomeAnimationStates(activeIndex: 0, state: AnimationStates.loading).copyWith());
          activeCurrentIndex = activeCurrentIndex == categoriesModel!.data!.length - 1 ? 0 : activeCurrentIndex! + 1;
          isSuccessImageSwitching = true;
          emit(HomeAnimationStates(activeIndex: activeCurrentIndex, state: AnimationStates.success).copyWith());
        },
      );
    }
  }
}
