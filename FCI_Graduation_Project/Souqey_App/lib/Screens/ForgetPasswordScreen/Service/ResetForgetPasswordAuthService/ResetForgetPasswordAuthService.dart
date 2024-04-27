// ignore_for_file: file_names

import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:injectable/injectable.dart';
import 'package:souqey/Config/AppConfigs.dart';

@injectable
class ResetForgetPasswordAuthService {
  final String? _email;

  Future<bool?>? resetForgetPasswordService() async {
    try {
      if (_email != null) {
        final resetForgetPasswordAuthApiResponse = await http.post(
          Uri.tryParse(resetForgetPasswordAuthEndPoint)!,
          headers: <String, String>{HttpHeaders.contentTypeHeader: "application/json"},
          body: jsonEncode(<String, String?>{
            "email": _email,
          }),
        );
        if (resetForgetPasswordAuthApiResponse.statusCode == 200 || resetForgetPasswordAuthApiResponse.statusCode == 201) {
          final resetForgetPasswordAuthResponseData = jsonDecode(resetForgetPasswordAuthApiResponse.body);
          if (resetForgetPasswordAuthResponseData['message'] == "Success") {
            return true;
          } else {
            return false;
          }
        } else {
          throw Exception("Reset Forget Password Auth Api Bad Request");
        }
      } else {
        throw Exception("Reset Forget Password Auth Sufficient Data not Available");
      }
    } on Exception catch (e) {
      log(e.toString(), name: "Reset Forget Password Auth Exception");
    }
    return null;
  }

  ResetForgetPasswordAuthService._resetForgetPassword({required final String? email}) : _email = email;

  @factoryMethod
  factory ResetForgetPasswordAuthService({@factoryParam required final String? email}) =>
      ResetForgetPasswordAuthService._resetForgetPassword(email: email);
}
