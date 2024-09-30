

import 'package:get_it/get_it.dart';

import 'FEATURES/HOMEPAGE/data/remote/home_remote_data_source.dart';
import 'FEATURES/HOMEPAGE/data/repository/home_repository_impl.dart';
import 'FEATURES/HOMEPAGE/domain/repository/home_repository.dart';
import 'FEATURES/HOMEPAGE/domain/usecase/get_hotels_usecase.dart';
import 'FEATURES/HOMEPAGE/domain/usecase/get_staffs_usecase.dart';

final sl = GetIt.instance;

Future<void> init() async {
  //data source

  sl.registerLazySingleton<HomeRemoteDataSource>(() => HomeRemoteDataSourceImpl());

  //repository
  sl.registerLazySingleton<HomeRepository>(() => HomeRepositoryImpl(sl()));

  //usecase
  sl.registerLazySingleton<GetHotelsUseCase>(() => GetHotelsUseCase(sl()));
  sl.registerLazySingleton<GetStaffsUseCase>(() => GetStaffsUseCase(sl()));


  // await GetStorage.init();
  // // sl.registerSingleton(NavigationBarMoksha(sl()));
  // // sl.registerLazySingleton<ConnectionInfo>(() => ConnectionInfoImpl(sl()));
  // // sl.registerLazySingleton(() => InternetConnectionChecker());
  // sl.registerLazySingleton(() => GetStorage());
}