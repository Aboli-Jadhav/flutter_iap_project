import 'package:flutter_iap_project/Authentication/services/authentication_service.dart';
import 'package:get_it/get_it.dart';
import 'package:flutter_iap_project/Authentication/services/navigator_service.dart';

GetIt locator = GetIt.instance;

void setupLocator() {
  locator.registerLazySingleton(() => NavigationService());
  locator.registerLazySingleton(() => AuthenticationService());
}