import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:souqey/Config/AppConfigs.dart';
import 'package:souqey/Helpers/Local_Cache_Helper/cache_helper.dart';
import 'package:souqey/Injections/Base_Injection.dart';
import 'package:souqey/souqey_app.dart';

void main() async {
  init_Dependency();
  WidgetsFlutterBinding.ensureInitialized();
  CacheHelper.init();
  SharedPreferences localChache = await CacheHelper.returningPreference();
  if (UserSignUpToken == null && localChache.containsKey(User_SignUp_Auth_Token)) {
    UserSignUpToken = localChache.get(User_SignUp_Auth_Token)! as String?;
    log("User SignUp Auth Token: $UserSignUpToken", name: "User SignUp Token");
  }
  if (UserLogInToken == null && localChache.containsKey(User_LogIn_Auth_Token)) {
    UserLogInToken = localChache.get(User_LogIn_Auth_Token)! as String?;
    log("User LogIn Auth Token: $UserLogInToken", name: "User LogIn Token");
  }
  runApp(const SouqeyApp());
}
