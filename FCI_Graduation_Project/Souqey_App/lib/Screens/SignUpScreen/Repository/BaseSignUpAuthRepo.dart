// ignore_for_file: file_names

import 'package:souqey/Models/UserProfileModel/UserProfileModel.dart';

abstract class BaseSignUpAuthRepo {
  Future<UserProfileModel?>? signUp();
}
