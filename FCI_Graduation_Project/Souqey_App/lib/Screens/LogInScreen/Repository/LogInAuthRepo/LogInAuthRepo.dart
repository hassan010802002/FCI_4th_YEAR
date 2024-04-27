import 'package:injectable/injectable.dart';
import 'package:souqey/Injections/Base_Injection.dart';
import 'package:souqey/Models/CustomUserDataModule/CustomUserDataModule.dart';
import 'package:souqey/Models/UserProfileModel/UserProfileModel.dart';
import 'package:souqey/Screens/LogInScreen/Repository/BaseLogInAuthRepo.dart';
import 'package:souqey/Screens/LogInScreen/Service/LogInAuthService/LogInAuthService.dart';

@injectable
class LogInAuthRepo implements BaseLogInAuthRepo {
  CustomUserDataModule? _userDataModule;
  UserProfileModel? _userProfileModel;
  LogInAuthService? _logInAuthService;

  LogInAuthRepo._logInService({
    required final CustomUserDataModule? userDataModule,
  }) : _userDataModule = userDataModule {
    _logInAuthService = get_Locator_it.get<LogInAuthService>(param1: _userDataModule);
  }

  @factoryMethod
  factory LogInAuthRepo({
    @factoryParam required final CustomUserDataModule? myUserDataModel,
  }) =>
      LogInAuthRepo._logInService(userDataModule: myUserDataModel);

  @override
  Future<UserProfileModel?>? logIn() async {
    if (_userDataModule != null) {
      if (_logInAuthService != null) {
        _userProfileModel = await _logInAuthService!.logInService();
        return _userProfileModel!;
      } else {
        throw Exception("LogIn Service Failure");
      }
    } else {
      throw Exception("LogIn Service Repo Sufficient Data not Available");
    }
  }
}
