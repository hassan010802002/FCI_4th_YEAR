import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:souqey/Injections/Base_Injection.dart';
import 'package:souqey/Models/AllProductsModel/AllProductsModel.dart' as Products;
import 'package:souqey/Models/CategoriesModel/CategoriesModel.dart' as Categories;
import 'package:souqey/Models/SubCategoriesModel/SubCategoriesModel.dart' as SubCategories;
import 'package:souqey/Models/SubCategoriesModel/SubCategoriesModel.dart';
import 'package:souqey/Screens/CategoriesScreen/Repository/GetAllProductsOnCategoryRepo/GetAllProductsOnCategoryRepoImpl.dart';
import 'package:souqey/Screens/CategoriesScreen/Repository/GetAllProductsRepository/GetAllProductsRepository.dart';
import 'package:souqey/Screens/CategoriesScreen/Repository/GetAllSubCategoriesOnCategoryRepoImpl/GetAllSubCategoriesOnCategoryRepoImpl.dart';
import 'package:souqey/Screens/CategoriesScreen/Repository/GetCategoriesRepo/GetCategoriesRepo.dart';
import 'package:souqey/Screens/CategoriesScreen/Service/GetAllProductsOnCategoryService/GetAllProductsOnCategoryService.dart';
import 'package:souqey/Screens/CategoriesScreen/Service/GetAllSubCategoriesOnCategoryService/GetAllSubCategoriesOnCategoryService.dart';

part 'categories_controller_event.dart';
part 'categories_controller_state.dart';

@injectable
class CategoriesControllerBloc extends Bloc<CategoriesControllerEvent, CategoriesControllerState> {
  bool isSuccessCategoriesService = false;
  bool isSuccessProductsService = false;
  bool isSuccessProductsOnCategoryService = false;
  bool isSuccessSubCategoriesService = false;
  int categoryViews = 0;
  int? activeCategoryIdx;
  GetCategoriesRepo? _categoriesRepo;
  GetAllProductsRepository? _productsRepository;
  GetAllSubCategoriesOnCategoryRepoImpl? _subCategoriesOnCategoryRepo;
  GetAllProductsOnCategoryRepoImpl? _productsOnCategoryRepo;
  Categories.CategoriesModel? categoriesModel;
  Products.AllProductsModel? productsModel;
  Products.AllProductsModel? productsOnCategoryModel;
  SubCategories.SubCategoriesModel? subCategoriesModel;

  CategoriesControllerBloc() : super(CategoriesControllerInitial()) {
    _categoriesRepo = get_Locator_it.get<GetCategoriesRepo>();
    _productsRepository = get_Locator_it.get<GetAllProductsRepository>();
    _subCategoriesOnCategoryRepo = get_Locator_it.get<GetAllSubCategoriesOnCategoryRepoImpl>(
      param1: get_Locator_it.get<GetAllSubCategoriesOnCategoryService>(),
    );
    _productsOnCategoryRepo = get_Locator_it.get<GetAllProductsOnCategoryRepoImpl>(
      param1: get_Locator_it.get<GetAllProductsOnCategoryService>(),
    );

    on<CategoriesGetCategoriesEvent>((event, emit) async {
      isSuccessCategoriesService = false;
      emit(CategoriesGetCategoriesState(
        categoriesModel: Categories.CategoriesModel(),
        state: CategoriesStates.loading,
      ).copyWith());
      try {
        if (_categoriesRepo != null) {
          categoriesModel = await _categoriesRepo!.getCategories();
          isSuccessCategoriesService = true;
          emit(CategoriesGetCategoriesState(
            categoriesModel: categoriesModel,
            state: CategoriesStates.success,
          ).copyWith());
        } else {
          isSuccessCategoriesService = false;
          emit(CategoriesGetCategoriesState(
            categoriesModel: Categories.CategoriesModel(),
            state: CategoriesStates.failure,
          ).copyWith());
          throw Exception("Categories Controller Failure");
        }
      } on Exception catch (e) {
        isSuccessCategoriesService = false;
        log(e.toString(), name: "Categories Controller Exception");
        emit(CategoriesGetCategoriesState(
          categoriesModel: Categories.CategoriesModel(),
          state: CategoriesStates.failure,
        ).copyWith());
      }
    });
    on<CategoriesGetProductsEvent>((event, emit) async {
      isSuccessProductsService = false;
      emit(CategoriesGetProductsState(
        productsModel: Products.AllProductsModel(),
        state: ProductsStates.loading,
      ).copyWith());
      try {
        if (_productsRepository != null) {
          productsModel = await _productsRepository!.getProducts();
          isSuccessProductsService = true;
          emit(CategoriesGetProductsState(
            productsModel: productsModel,
            state: ProductsStates.success,
          ).copyWith());
        } else {
          isSuccessProductsService = false;
          emit(CategoriesGetProductsState(
            productsModel: Products.AllProductsModel(),
            state: ProductsStates.failure,
          ).copyWith());
          throw Exception("Products Controller Failure");
        }
      } on Exception catch (e) {
        isSuccessProductsService = false;
        log(e.toString(), name: "Products Controller Exception");
        emit(CategoriesGetProductsState(
          productsModel: Products.AllProductsModel(),
          state: ProductsStates.failure,
        ).copyWith());
      }
    });
    on<CategoriesGetAllProductsOnCategoryEvent>((event, emit) async {
      isSuccessProductsOnCategoryService = false;
      emit(CategoriesGetProductsOnCategoryState(
        productsOnCategoryModel: Products.AllProductsModel(),
        state: ProductsOnCategoryStates.loading,
      ).copyWith());
      try {
        if (_productsOnCategoryRepo != null) {
          productsOnCategoryModel = await _productsOnCategoryRepo!.getAllProductsOnCategory(
            categoryId: categoriesModel!.data!.elementAt(activeCategoryIdx!).id,
          );
          isSuccessProductsOnCategoryService = true;
          emit(CategoriesGetProductsOnCategoryState(
            productsOnCategoryModel: productsOnCategoryModel,
            state: ProductsOnCategoryStates.success,
          ).copyWith());
        } else {
          isSuccessProductsOnCategoryService = false;
          emit(CategoriesGetProductsOnCategoryState(
            productsOnCategoryModel: Products.AllProductsModel(),
            state: ProductsOnCategoryStates.failure,
          ).copyWith());
          throw Exception("Products On Category Controller Failure");
        }
      } on Exception catch (e) {
        isSuccessProductsOnCategoryService = false;
        log(e.toString(), name: "Products On Category Controller Exception");
        emit(CategoriesGetProductsOnCategoryState(
          productsOnCategoryModel: Products.AllProductsModel(),
          state: ProductsOnCategoryStates.failure,
        ).copyWith());
      }
    });
    on<CategoriesGetSubCategoriesEvent>((event, emit) async {
      isSuccessSubCategoriesService = false;
      emit(CategoriesGetSubCategoriesState(
        subCategoriesModel: SubCategories.SubCategoriesModel(),
        state: SubCategoriesStates.loading,
      ));
      try {
        if (_subCategoriesOnCategoryRepo != null) {
          subCategoriesModel = await _subCategoriesOnCategoryRepo!.getAllSubCategoriesOnCategory(categoryId: event.categoryId)!;
          isSuccessSubCategoriesService = true;
          emit(CategoriesGetSubCategoriesState(
            subCategoriesModel: subCategoriesModel,
            state: SubCategoriesStates.success,
          ));
        } else {
          isSuccessSubCategoriesService = false;
          emit(CategoriesGetSubCategoriesState(
            subCategoriesModel: SubCategories.SubCategoriesModel(),
            state: SubCategoriesStates.failure,
          ));
          throw Exception("SubCategories Controller Exception");
        }
      } on Exception catch (e) {
        log(e.toString(), name: "SubCategories Controller Exception");
        emit(CategoriesGetSubCategoriesState(
          subCategoriesModel: SubCategories.SubCategoriesModel(),
          state: SubCategoriesStates.failure,
        ));
      }
    });
  }

  void changeCategoryView() {
    if (categoryViews == 0) {
      categoryViews = 1;
      emit(const CategoriesChangeViewState(state: CategoriesViewsStates.second));
    } else if (categoryViews == 1) {
      categoryViews = 2;
      emit(const CategoriesChangeViewState(state: CategoriesViewsStates.third));
    } else {
      categoryViews = 0;
      emit(const CategoriesChangeViewState(state: CategoriesViewsStates.first));
    }
  }

  void changeCategoryViewBackWord() {
    if (categoryViews == 2) {
      categoryViews = 1;
      emit(const CategoriesChangeViewState(state: CategoriesViewsStates.second));
    } else if (categoryViews == 1) {
      categoryViews = 0;
      emit(const CategoriesChangeViewState(state: CategoriesViewsStates.first));
    } else {}
  }
}
