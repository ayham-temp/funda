import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart';
import 'package:injectable/injectable.dart';

import 'injection.config.dart';

final _getIt = GetIt.instance;

@InjectableInit()
configureDependencies() => $initGetIt(_getIt);

@module
abstract class RegisterModule {

  @lazySingleton
  Client get client => Client();

  @lazySingleton
  Connectivity get connectivity => Connectivity();

}
