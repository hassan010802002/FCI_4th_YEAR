import 'package:injectable/injectable.dart';
import 'package:souqey/Injections/Base_Injection.dart';
import 'package:souqey/Models/CustomUserDataModule/CustomUserDataModule.dart';
import 'package:souqey/Models/UserProfileModel/UserProfileModel.dart';
import 'package:souqey/Screens/SignUpScreen/Repository/BaseSignUpAuthRepo.dart';
import 'package:souqey/Screens/SignUpScreen/Service/SignUpAuthService/SignUpAuthService.dart';

@injectable
class SignUpAuthRepo implements BaseSignUpAuthRepo {
  CustomUserDataModule? _userDataModule;
  UserProfileModel? _userProfileModel;
  SignUpAuthService? _signUpAuthService;

  SignUpAuthRepo._signUpService({
    required final CustomUserDataModule? userDataModule,
  }) : _userDataModule = userDataModule {
    _signUpAuthService = get_Locator_it<SignUpAuthService>(param1: _userDataModule!);
  }

  @factoryMethod
  factory SignUpAuthRepo({
    @factoryParam required final CustomUserDataModule? myUserDataModel,
  }) =>
      SignUpAuthRepo._signUpService(userDataModule: myUserDataModel!);

  @override
  Future<UserProfileModel?>? signUp() async {
    if (_userDataModule != null) {
      if (_signUpAuthService != null) {
        _userProfileModel = await _signUpAuthService!.signUpService();
        return _userProfileModel;
      } else {
        throw Exception("SignUp Service Failure");
      }
    } else {
      throw Exception("SignUp Service Repo Sufficient Data not Available");
    }
  }
}
