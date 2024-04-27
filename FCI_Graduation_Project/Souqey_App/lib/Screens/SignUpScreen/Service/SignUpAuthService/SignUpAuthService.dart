// ignore_for_file: file_names

import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:injectable/injectable.dart';
import 'package:souqey/Config/AppConfigs.dart';
import 'package:souqey/Helpers/Local_Cache_Helper/cache_helper.dart';
import 'package:souqey/Models/CustomUserDataModule/CustomUserDataModule.dart';
import 'package:souqey/Models/UserProfileModel/UserProfileModel.dart';

@injectable
class SignUpAuthService {
  final CustomUserDataModule? _userDataModule;

  Future<UserProfileModel?>? signUpService() async {
    try {
      if (_userDataModule != null) {
        final signUpAuthApiResponse = await http.post(
          Uri.tryParse(SignUpAuthEndPoint)!,
          headers: <String, String>{HttpHeaders.contentTypeHeader: "application/json"},
          body: jsonEncode(<String, String?>{
            "name": _userDataModule.name!,
            "email": _userDataModule.email!,
            "password": _userDataModule.password!,
            "rePassword": _userDataModule.rePassword!,
            "phone": "+201234567890",
          }),
        );
        if (signUpAuthApiResponse.statusCode == 200 || signUpAuthApiResponse.statusCode == 201) {
          final signUpAuthResponseData = jsonDecode(signUpAuthApiResponse.body);
          await CacheHelper.saveData(key: User_SignUp_Auth_Token, value: signUpAuthResponseData['token']);
          UserSignUpToken = await CacheHelper.getData(key: User_SignUp_Auth_Token);
          return UserProfileModel.fromJson(signUpAuthResponseData);
        } else {
          throw Exception("SignUp Auth Api Bad Request");
        }
      } else {
        throw Exception("SignUp Auth Sufficient Data not Available");
      }
    } on Exception catch (e) {
      log(e.toString(), name: "SignUp Auth Exception");
    }
    return null;
  }

  const SignUpAuthService._signUpAuthService({
    required final CustomUserDataModule? userDataModule,
  }) : _userDataModule = userDataModule;

  @factoryMethod
  factory SignUpAuthService({
    @factoryParam required final CustomUserDataModule? userDataModule,
  }) =>
      SignUpAuthService._signUpAuthService(userDataModule: userDataModule!);
}
