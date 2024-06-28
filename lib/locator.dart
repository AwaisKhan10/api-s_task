import 'package:get_it/get_it.dart';
import 'package:pickmed/core/services/auth_serives.dart';
import 'package:pickmed/core/services/data_base_services.dart';
import 'package:pickmed/core/services/local_storage.dart';

import 'core/services/api_services.dart';

GetIt locator = GetIt.instance;

setupLocator() {
  // final _instance = await LocalStorageService.getInstance();
  // locator.registerSingleton(_instance);
  locator.registerSingleton(LocalStorageService());
  locator.registerSingleton(AuthServices());
  // locator.registerSingleton(NotificationsService());
  locator.registerSingleton(DatabaseService());
  locator.registerSingleton(ApiServices());
  // locator.registerLazySingleton(() => FilePickerService());
}
