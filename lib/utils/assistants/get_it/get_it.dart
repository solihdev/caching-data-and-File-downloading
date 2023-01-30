import 'package:cachingdata_and_filedownloading/data/api_service/api_service.dart';
import 'package:cachingdata_and_filedownloading/data/repositories/local_db.dart';
import 'package:get_it/get_it.dart';
import '../../../data/repositories/product_repo.dart';

final getIt = GetIt.instance;

void setup() {
  getIt.registerLazySingleton(() => ApiService());
  getIt.registerLazySingleton(() => ProductRepo());
  getIt.registerLazySingleton(() => LocalDatabase());
}