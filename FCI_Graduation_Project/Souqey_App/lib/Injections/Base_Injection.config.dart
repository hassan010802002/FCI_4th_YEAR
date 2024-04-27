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
    as _i12;
import '../Screens/ForgetPasswordScreen/Service/ResetForgetPasswordAuthService/ResetForgetPasswordAuthService.dart'
    as _i13;
import '../Screens/HomeScreen/Controller/home_controller_bloc.dart' as _i8;
import '../Screens/HomeScreen/Repository/GetCategoriesRepo/GetCategoriesRepo.dart'
    as _i6;
import '../Screens/HomeScreen/Service/GetCategoriesService/GetCategoriesService.dart'
    as _i7;
import '../Screens/LogInScreen/Controller/log_in_controller_bloc.dart' as _i11;
import '../Screens/LogInScreen/Repository/LogInAuthRepo/LogInAuthRepo.dart'
    as _i9;
import '../Screens/LogInScreen/Service/LogInAuthService/LogInAuthService.dart'
    as _i10;
import '../Screens/SignUpScreen/Controller/sign_up_controller_bloc.dart'
    as _i16;
import '../Screens/SignUpScreen/Repository/SignUpAuthRepo/SignUpAuthRepo.dart'
    as _i14;
import '../Screens/SignUpScreen/Service/SignUpAuthService/SignUpAuthService.dart'
    as _i15;

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
    gh.factory<_i6.GetCategoriesRepo>(() => _i6.GetCategoriesRepo());
    gh.factory<_i7.GetCategoriesService>(() => _i7.GetCategoriesService());
    gh.factory<_i8.HomeControllerBloc>(() => _i8.HomeControllerBloc());
    gh.factoryParam<_i9.LogInAuthRepo, _i4.CustomUserDataModule?, dynamic>((
      myUserDataModel,
      _,
    ) =>
        _i9.LogInAuthRepo(myUserDataModel: myUserDataModel));
    gh.factoryParam<_i10.LogInAuthService, _i4.CustomUserDataModule?, dynamic>((
      userDataModule,
      _,
    ) =>
        _i10.LogInAuthService(userDataModule: userDataModule));
    gh.factory<_i11.LogInControllerBloc>(() => _i11.LogInControllerBloc());
    gh.factoryParam<_i12.ResetForgetPasswordAuthRepo, String?, dynamic>((
      email,
      _,
    ) =>
        _i12.ResetForgetPasswordAuthRepo(email: email));
    gh.factoryParam<_i13.ResetForgetPasswordAuthService, String?, dynamic>((
      email,
      _,
    ) =>
        _i13.ResetForgetPasswordAuthService(email: email));
    gh.factoryParam<_i14.SignUpAuthRepo, _i4.CustomUserDataModule?, dynamic>((
      myUserDataModel,
      _,
    ) =>
        _i14.SignUpAuthRepo(myUserDataModel: myUserDataModel));
    gh.factoryParam<_i15.SignUpAuthService, _i4.CustomUserDataModule?, dynamic>(
        (
      userDataModule,
      _,
    ) =>
            _i15.SignUpAuthService(userDataModule: userDataModule));
    gh.factory<_i16.SignUpControllerBloc>(() => _i16.SignUpControllerBloc());
    return this;
  }
}
