// ignore_for_file: file_names, non_constant_identifier_names
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

import 'Base_Injection.config.dart';

final GetIt get_Locator_it = GetIt.instance;

@InjectableInit(
  initializerName: 'init', // default
  preferRelativeImports: true, // default
  asExtension: true, // default
  rootDir: "lib/Injections",
)
void init_Dependency() => get_Locator_it.init();
