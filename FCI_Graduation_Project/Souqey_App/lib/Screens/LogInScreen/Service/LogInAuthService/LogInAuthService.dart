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
class LogInAuthService {
  final CustomUserDataModule? _userDataModule;

  Future<UserProfileModel?>? logInService() async {
    try {
      if (_userDataModule != null) {
        final logInAuthApiResponse = await http.post(
          Uri.tryParse(LogInAuthEndPoint)!,
          headers: <String, String>{HttpHeaders.contentTypeHeader: "application/json"},
          body: jsonEncode(<String, String?>{
            "email": _userDataModule.email,
            "password": _userDataModule.password,
          }),
        );
        if (logInAuthApiResponse.statusCode == 200 || logInAuthApiResponse.statusCode == 201) {
          final logInAuthResponseData = jsonDecode(logInAuthApiResponse.body);
          await CacheHelper.saveData(key: User_LogIn_Auth_Token, value: logInAuthResponseData['token']);
          UserLogInToken = await CacheHelper.getData(key: User_LogIn_Auth_Token);
          return UserProfileModel.fromJson(logInAuthResponseData);
        } else {
          throw Exception("LogIn Auth Api Bad Request");
        }
      } else {
        throw Exception("LogIn Auth Sufficient Data not Available");
      }
    } on Exception catch (e) {
      log(e.toString(), name: "LogIn Auth Exception");
    }
    return null;
  }

  const LogInAuthService._logInAuthService({
    required CustomUserDataModule? userDataModule,
  }) : _userDataModule = userDataModule;

  @factoryMethod
  factory LogInAuthService({
    @factoryParam required final CustomUserDataModule? userDataModule,
  }) =>
      LogInAuthService._logInAuthService(userDataModule: userDataModule!);
}
