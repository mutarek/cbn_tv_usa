import 'package:cbn_tv_usa/app/module/category/controller/category_controller.dart';
import 'package:cbn_tv_usa/app/module/category/repo/category_repo.dart';
import 'package:cbn_tv_usa/app/module/home/controller/home_controller.dart';
import 'package:cbn_tv_usa/app/module/home/repo/home_repo.dart';
import 'package:cbn_tv_usa/app/remote/dio/dio_client.dart';
import 'package:cbn_tv_usa/app/remote/dio/loggingInterceptor.dart';
import 'package:cbn_tv_usa/app/utils/appConstant.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import 'app/splash/splash_provider.dart';

final sl = GetIt.instance;

Future<void> init() async {
  // Core
  sl.registerLazySingleton(
      () => DioClient(AppConstant.baseUrl, sl(), loggingInterceptor: sl()));

  // Repository
  sl.registerLazySingleton(() => HomeRepository(dioClient: sl()));
  sl.registerLazySingleton(() => CategoryRepository(dioClient: sl()));

  // Provider
  sl.registerFactory(() => SplashProvider());
  sl.registerFactory(() => HomeController(homeRepository: sl()));
  sl.registerFactory(() => CategoryController(categoryRepository: sl()));

  // External
  sl.registerLazySingleton(() => Dio());
  sl.registerLazySingleton(() => LoggingInterceptor());
}
