import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:souqey/Config/AppConfigs.dart';
import 'package:souqey/Helpers/Local_Cache_Helper/cache_helper.dart';
import 'package:souqey/Helpers/Local_DB_Helper/Locale_DB_Helper.dart';
import 'package:souqey/Injections/Base_Injection.dart';
import 'package:souqey/souqey_app.dart';

void main() async {
  init_Dependency();
  WidgetsFlutterBinding.ensureInitialized();
  FavDB ??= get_Locator_it.get<FavoriteDbHelper>();
  CacheHelper.init();
  SharedPreferences localCache = await CacheHelper.returningPreference();
  if (UserSignUpToken == null && localCache.containsKey(User_SignUp_Auth_Token)) {
    UserSignUpToken = localCache.get(User_SignUp_Auth_Token)! as String?;
    log("User SignUp Auth Token: $UserSignUpToken", name: "User SignUp Token");
  }
  if (UserLogInToken == null && localCache.containsKey(User_LogIn_Auth_Token)) {
    UserLogInToken = localCache.get(User_LogIn_Auth_Token)! as String?;
    log("User LogIn Auth Token: $UserLogInToken", name: "User LogIn Token");
  }
  configLoading();
  runApp(const SouqeyApp());
}

void configLoading() {
  EasyLoading.instance
    ..displayDuration = const Duration(seconds: 3)
    ..indicatorType = EasyLoadingIndicatorType.hourGlass
    ..fontSize = 20.0
    ..loadingStyle = EasyLoadingStyle.custom
    ..indicatorSize = 50.0
    ..radius = 20.0
    ..progressColor = Colors.yellow
    ..backgroundColor = Colors.deepOrange.withOpacity(0.8)
    ..indicatorColor = Colors.yellowAccent
    ..textColor = Colors.white
    ..maskColor = Colors.blueGrey.withOpacity(0.6)
    ..maskType = EasyLoadingMaskType.custom
    ..toastPosition = EasyLoadingToastPosition.bottom
    ..userInteractions = true
    ..animationStyle = EasyLoadingAnimationStyle.scale;
}
