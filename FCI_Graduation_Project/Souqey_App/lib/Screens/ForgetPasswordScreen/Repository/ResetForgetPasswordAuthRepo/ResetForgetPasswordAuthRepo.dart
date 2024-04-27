// ignore_for_file: file_names

import 'package:injectable/injectable.dart';
import 'package:souqey/Injections/Base_Injection.dart';
import 'package:souqey/Screens/ForgetPasswordScreen/Repository/BaseResetForgetPasswordAuthRepo.dart';
import 'package:souqey/Screens/ForgetPasswordScreen/Service/ResetForgetPasswordAuthService/ResetForgetPasswordAuthService.dart';

@injectable
class ResetForgetPasswordAuthRepo implements BaseResetForgetPasswordAuthRepo {
  final String? _email;
  bool? _resetForgetPasswordServiceStatus;
  ResetForgetPasswordAuthService? _resetForgetPasswordAuthService;

  @override
  Future<bool?>? reset() async {
    if (_email != null) {
      if (_resetForgetPasswordAuthService != null) {
        _resetForgetPasswordServiceStatus = await _resetForgetPasswordAuthService!.resetForgetPasswordService()!;
        return _resetForgetPasswordServiceStatus!;
      } else {
        throw Exception("Reset Forget Password Service Failure");
      }
    } else {
      throw Exception("Reset Forget Password Service Sufficient Data not Available");
    }
  }

  ResetForgetPasswordAuthRepo.forgetPassword({required final String? email}) : _email = email {
    _resetForgetPasswordAuthService = get_Locator_it.get<ResetForgetPasswordAuthService>(param1: _email);
  }

  @factoryMethod
  factory ResetForgetPasswordAuthRepo({@factoryParam required final String? email}) => ResetForgetPasswordAuthRepo.forgetPassword(email: email);
}
