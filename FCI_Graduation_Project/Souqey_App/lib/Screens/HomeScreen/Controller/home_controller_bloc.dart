// ignore_for_file: invalid_use_of_visible_for_testing_member

import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:souqey/Injections/Base_Injection.dart';
import 'package:souqey/Models/AllProductsModel/AllProductsModel.dart';
import 'package:souqey/Models/CategoriesModel/CategoriesModel.dart';
import 'package:souqey/Screens/HomeScreen/Repository/GetAllProductsRepository/GetAllProductsRepository.dart';
import 'package:souqey/Screens/HomeScreen/Repository/GetCategoriesRepo/GetCategoriesRepo.dart';

part 'home_controller_event.dart';
part 'home_controller_state.dart';

@injectable
class HomeControllerBloc extends Bloc<HomeControllerEvent, HomeControllerState> {
  bool isSuccessCategoriesService = false;
  bool isSuccessProductsService = false;
  bool isImageSwitching = false;
  bool isSuccessFilter = false;
  CategoriesModel? categoriesModel;
  GetCategoriesRepo? _categoriesRepo;
  GetAllProductsRepository? _productsRepository;
  AllProductsModel? productsModel;
  int? activeCurrentIndex;
  int? activeCurrentView;

  HomeControllerBloc() : super(HomeControllerInitial()) {
    activeCurrentIndex = 0;
    activeCurrentView = 0;
    _categoriesRepo = get_Locator_it.get<GetCategoriesRepo>();
    _productsRepository = get_Locator_it.get<GetAllProductsRepository>();

    on<HomeGetCategoriesEvent>(
      (event, emit) async {
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
      },
    );

    on<HomeGetProductsEvent>(
      (event, emit) async {
        isSuccessProductsService = false;
        emit(HomeGetProductsState(
          productsModel: AllProductsModel(),
          state: ProductsStates.loading,
        ).copyWith());
        try {
          if (_productsRepository != null) {
            productsModel = await _productsRepository!.getProducts();
            isSuccessProductsService = true;
            emit(HomeGetProductsState(
              productsModel: productsModel,
              state: ProductsStates.success,
            ).copyWith());
          } else {
            isSuccessProductsService = false;
            emit(HomeGetProductsState(
              productsModel: AllProductsModel(),
              state: ProductsStates.failure,
            ).copyWith());
            throw Exception("Products Controller Failure");
          }
        } on Exception catch (e) {
          isSuccessProductsService = false;
          log(e.toString(), name: "Products Controller Exception");
          emit(HomeGetProductsState(
            productsModel: AllProductsModel(),
            state: ProductsStates.failure,
          ).copyWith());
        }
      },
    );
  }

  void switchingCurrentImage() {
    if (!isImageSwitching) {
      Timer.periodic(
        const Duration(seconds: 3),
        (timer) {
          activeCurrentIndex = activeCurrentIndex == categoriesModel!.data!.length - 1 ? 0 : activeCurrentIndex! + 1;
          emit(HomeAnimationStates(activeIndex: activeCurrentIndex, state: AnimationStates.success).copyWith());
        },
      );
    }
  }

  void switchingCurrentView() {
    if (activeCurrentView == 0) {
      activeCurrentView = 1;
      emit(HomeViewsStates(activeViewIndex: activeCurrentView, viewState: ViewStates.view1).copyWith());
    } else if (activeCurrentView == 1) {
      activeCurrentView = 2;
      emit(HomeViewsStates(activeViewIndex: activeCurrentView, viewState: ViewStates.view2).copyWith());
    }
  }

  void productsFilter() {
    if (isSuccessFilter) {
      for (var category in categoriesModel!.data!) {
        // productsModel!.data.
      }
    }
  }
}
