// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../Models/CustomUserDataModule/CustomUserDataModule.dart' as _i4;
import '../Screens/BaseHome/Controller/base_cubit.dart' as _i3;
import '../Screens/ForgetPasswordScreen/Controller/forget_password_controller_bloc.dart'
    as _i5;
import '../Screens/ForgetPasswordScreen/Repository/ResetForgetPasswordAuthRepo/ResetForgetPasswordAuthRepo.dart'
    as _i14;
import '../Screens/ForgetPasswordScreen/Service/ResetForgetPasswordAuthService/ResetForgetPasswordAuthService.dart'
    as _i15;
import '../Screens/HomeScreen/Controller/home_controller_bloc.dart' as _i10;
import '../Screens/HomeScreen/Repository/GetAllProductsRepository/GetAllProductsRepository.dart'
    as _i6;
import '../Screens/HomeScreen/Repository/GetCategoriesRepo/GetCategoriesRepo.dart'
    as _i8;
import '../Screens/HomeScreen/Service/GetAllProductsService/GetAllProductsService.dart'
    as _i7;
import '../Screens/HomeScreen/Service/GetCategoriesService/GetCategoriesService.dart'
    as _i9;
import '../Screens/LogInScreen/Controller/log_in_controller_bloc.dart' as _i13;
import '../Screens/LogInScreen/Repository/LogInAuthRepo/LogInAuthRepo.dart'
    as _i11;
import '../Screens/LogInScreen/Service/LogInAuthService/LogInAuthService.dart'
    as _i12;
import '../Screens/SignUpScreen/Controller/sign_up_controller_bloc.dart'
    as _i18;
import '../Screens/SignUpScreen/Repository/SignUpAuthRepo/SignUpAuthRepo.dart'
    as _i16;
import '../Screens/SignUpScreen/Service/SignUpAuthService/SignUpAuthService.dart'
    as _i17;

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
    gh.factory<_i4.CustomUserDataModule>(() => _i4.CustomUserDataModule());
    gh.factory<_i5.ForgetPasswordControllerBloc>(
        () => _i5.ForgetPasswordControllerBloc());
    gh.factory<_i6.GetAllProductsRepository>(
        () => _i6.GetAllProductsRepository());
    gh.factory<_i7.GetAllProductsService>(() => _i7.GetAllProductsService());
    gh.factory<_i8.GetCategoriesRepo>(() => _i8.GetCategoriesRepo());
    gh.factory<_i9.GetCategoriesService>(() => _i9.GetCategoriesService());
    gh.factory<_i10.HomeControllerBloc>(() => _i10.HomeControllerBloc());
    gh.factoryParam<_i11.LogInAuthRepo, _i4.CustomUserDataModule?, dynamic>((
      myUserDataModel,
      _,
    ) =>
        _i11.LogInAuthRepo(myUserDataModel: myUserDataModel));
    gh.factoryParam<_i12.LogInAuthService, _i4.CustomUserDataModule?, dynamic>((
      userDataModule,
      _,
    ) =>
        _i12.LogInAuthService(userDataModule: userDataModule));
    gh.factory<_i13.LogInControllerBloc>(() => _i13.LogInControllerBloc());
    gh.factoryParam<_i14.ResetForgetPasswordAuthRepo, String?, dynamic>((
      email,
      _,
    ) =>
        _i14.ResetForgetPasswordAuthRepo(email: email));
    gh.factoryParam<_i15.ResetForgetPasswordAuthService, String?, dynamic>((
      email,
      _,
    ) =>
        _i15.ResetForgetPasswordAuthService(email: email));
    gh.factoryParam<_i16.SignUpAuthRepo, _i4.CustomUserDataModule?, dynamic>((
      myUserDataModel,
      _,
    ) =>
        _i16.SignUpAuthRepo(myUserDataModel: myUserDataModel));
    gh.factoryParam<_i17.SignUpAuthService, _i4.CustomUserDataModule?, dynamic>(
        (
      userDataModule,
      _,
    ) =>
            _i17.SignUpAuthService(userDataModule: userDataModule));
    gh.factory<_i18.SignUpControllerBloc>(() => _i18.SignUpControllerBloc());
    return this;
  }
}
