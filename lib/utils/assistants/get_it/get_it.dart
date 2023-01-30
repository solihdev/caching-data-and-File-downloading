import 'package:cachingdata_and_filedownloading/data/api_service/api_service.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void setup() {
  getIt.registerLazySingleton(() => ApiService());
  // getIt.registerLazySingleton(() => CountriesRepository());
  // getIt.registerLazySingleton(() => LocalDatabase());
  // getIt.registerLazySingleton(() => CardRepository(firebaseFirestore: FirebaseFirestore.instance));
}