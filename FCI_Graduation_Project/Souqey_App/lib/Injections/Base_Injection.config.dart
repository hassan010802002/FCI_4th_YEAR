// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../Models/CustomUserDataModule/CustomUserDataModule.dart' as _i5;
import '../Screens/BaseHome/Controller/base_cubit.dart' as _i3;
import '../Screens/CategoriesScreen/Controller/categories_controller_bloc.dart'
    as _i4;
import '../Screens/CategoriesScreen/Repository/GetAllProductsOnCategoryRepo/GetAllProductsOnCategoryRepoImpl.dart'
    as _i7;
import '../Screens/CategoriesScreen/Repository/GetAllProductsRepository/GetAllProductsRepository.dart'
    as _i9;
import '../Screens/CategoriesScreen/Repository/GetAllSubCategoriesOnCategoryRepoImpl/GetAllSubCategoriesOnCategoryRepoImpl.dart'
    as _i13;
import '../Screens/CategoriesScreen/Repository/GetCategoriesRepo/GetCategoriesRepo.dart'
    as _i16;
import '../Screens/CategoriesScreen/Service/GetAllProductsOnCategoryService/GetAllProductsOnCategoryService.dart'
    as _i8;
import '../Screens/CategoriesScreen/Service/GetAllProductsService/GetAllProductsService.dart'
    as _i12;
import '../Screens/CategoriesScreen/Service/GetAllSubCategoriesOnCategoryService/GetAllSubCategoriesOnCategoryService.dart'
    as _i14;
import '../Screens/CategoriesScreen/Service/GetCategoriesService/GetCategoriesService.dart'
    as _i18;
import '../Screens/ForgetPasswordScreen/Controller/forget_password_controller_bloc.dart'
    as _i6;
import '../Screens/ForgetPasswordScreen/Repository/ResetForgetPasswordAuthRepo/ResetForgetPasswordAuthRepo.dart'
    as _i23;
import '../Screens/ForgetPasswordScreen/Service/ResetForgetPasswordAuthService/ResetForgetPasswordAuthService.dart'
    as _i24;
import '../Screens/HomeScreen/Controller/home_controller_bloc.dart' as _i19;
import '../Screens/HomeScreen/Repository/GetAllProductsRepository/GetAllProductsRepository.dart'
    as _i10;
import '../Screens/HomeScreen/Repository/GetCategoriesRepo/GetCategoriesRepo.dart'
    as _i15;
import '../Screens/HomeScreen/Service/GetAllProductsService/GetAllProductsService.dart'
    as _i11;
import '../Screens/HomeScreen/Service/GetCategoriesService/GetCategoriesService.dart'
    as _i17;
import '../Screens/LogInScreen/Controller/log_in_controller_bloc.dart' as _i22;
import '../Screens/LogInScreen/Repository/LogInAuthRepo/LogInAuthRepo.dart'
    as _i20;
import '../Screens/LogInScreen/Service/LogInAuthService/LogInAuthService.dart'
    as _i21;
import '../Screens/SignUpScreen/Controller/sign_up_controller_bloc.dart'
    as _i27;
import '../Screens/SignUpScreen/Repository/SignUpAuthRepo/SignUpAuthRepo.dart'
    as _i25;
import '../Screens/SignUpScreen/Service/SignUpAuthService/SignUpAuthService.dart'
    as _i26;

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.factoryParam<_i3.BaseCubit, int?, dynamic>((
      baseIndex,
      _,
    ) =>
        _i3.BaseCubit(baseIndex));
    gh.factory<_i4.CategoriesControllerBloc>(
        () => _i4.CategoriesControllerBloc());
    gh.factory<_i5.CustomUserDataModule>(() => _i5.CustomUserDataModule());
    gh.factory<_i6.ForgetPasswordControllerBloc>(
        () => _i6.ForgetPasswordControllerBloc());
    gh.factoryParam<_i7.GetAllProductsOnCategoryRepoImpl,
        _i8.GetAllProductsOnCategoryService?, dynamic>((
      getAllProductsOnCategoryService,
      _,
    ) =>
        _i7.GetAllProductsOnCategoryRepoImpl(
            getAllProductsOnCategoryService: getAllProductsOnCategoryService));
    gh.factory<_i8.GetAllProductsOnCategoryService>(
        () => _i8.GetAllProductsOnCategoryService());
    gh.factory<_i9.GetAllProductsRepository>(
        () => _i9.GetAllProductsRepository());
    gh.factory<_i10.GetAllProductsRepository>(
        () => _i10.GetAllProductsRepository());
    gh.factory<_i11.GetAllProductsService>(() => _i11.GetAllProductsService());
    gh.factory<_i12.GetAllProductsService>(() => _i12.GetAllProductsService());
    gh.factoryParam<_i13.GetAllSubCategoriesOnCategoryRepoImpl,
        _i14.GetAllSubCategoriesOnCategoryService?, dynamic>((
      subCategoriesOnCategoryService,
      _,
    ) =>
        _i13.GetAllSubCategoriesOnCategoryRepoImpl(
            subCategoriesOnCategoryService: subCategoriesOnCategoryService));
    gh.factory<_i14.GetAllSubCategoriesOnCategoryService>(
        () => _i14.GetAllSubCategoriesOnCategoryService());
    gh.factory<_i15.GetCategoriesRepo>(() => _i15.GetCategoriesRepo());
    gh.factory<_i16.GetCategoriesRepo>(() => _i16.GetCategoriesRepo());
    gh.factory<_i17.GetCategoriesService>(() => _i17.GetCategoriesService());
    gh.factory<_i18.GetCategoriesService>(() => _i18.GetCategoriesService());
    gh.factory<_i19.HomeControllerBloc>(() => _i19.HomeControllerBloc());
    gh.factoryParam<_i20.LogInAuthRepo, _i5.CustomUserDataModule?, dynamic>((
      myUserDataModel,
      _,
    ) =>
        _i20.LogInAuthRepo(myUserDataModel: myUserDataModel));
    gh.factoryParam<_i21.LogInAuthService, _i5.CustomUserDataModule?, dynamic>((
      userDataModule,
      _,
    ) =>
        _i21.LogInAuthService(userDataModule: userDataModule));
    gh.factory<_i22.LogInControllerBloc>(() => _i22.LogInControllerBloc());
    gh.factoryParam<_i23.ResetForgetPasswordAuthRepo, String?, dynamic>((
      email,
      _,
    ) =>
        _i23.ResetForgetPasswordAuthRepo(email: email));
    gh.factoryParam<_i24.ResetForgetPasswordAuthService, String?, dynamic>((
      email,
      _,
    ) =>
        _i24.ResetForgetPasswordAuthService(email: email));
    gh.factoryParam<_i25.SignUpAuthRepo, _i5.CustomUserDataModule?, dynamic>((
      myUserDataModel,
      _,
    ) =>
        _i25.SignUpAuthRepo(myUserDataModel: myUserDataModel));
    gh.factoryParam<_i26.SignUpAuthService, _i5.CustomUserDataModule?, dynamic>(
        (
      userDataModule,
      _,
    ) =>
            _i26.SignUpAuthService(userDataModule: userDataModule));
    gh.factory<_i27.SignUpControllerBloc>(() => _i27.SignUpControllerBloc());
    return this;
  }
}
