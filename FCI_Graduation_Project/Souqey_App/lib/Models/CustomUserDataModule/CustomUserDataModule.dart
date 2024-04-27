// ignore_for_file: file_names
import 'package:injectable/injectable.dart';

@injectable
class CustomUserDataModule {
  String? _name;
  String? _email;
  String? _password;
  String? _rePassword;

  CustomUserDataModule();

  String? get rePassword => _rePassword;

  String? get password => _password;

  String? get email => _email;

  String? get name => _name;

  set rePassword(String? value) => _rePassword = value;

  set password(String? value) => _password = value;

  set email(String? value) => _email = value;

  set name(String? value) => _name = value;
}
