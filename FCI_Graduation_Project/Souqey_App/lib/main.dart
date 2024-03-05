import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:souqey/Helpers/Local_Cache_Helper/cache_helper.dart';
import 'package:souqey/souqey_app.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  CacheHelper.init();
  SharedPreferences localChache = await CacheHelper.returningPreference();
  runApp(const SouqeyApp());
}