import 'package:cis_training_g1/features/home/data/data_source/home_remote_data_source.dart';
import 'package:cis_training_g1/features/home/data/repository/home_repo.dart';
import 'package:cis_training_g1/features/home/presentation/view_model/home/home_cubit.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../core/api/api_consumer.dart';
import '../core/api/app_interceptor.dart';
import '../core/api/dio_consumer.dart';
import '../core/network/network.dart';
import '../core/storage/i_app_local_storage.dart';
import '../core/storage/shared_preference.dart';

final serviceLocator = GetIt.instance;

Future<void> setupServiceLocator() async {
  //! Bloc
  await _setUpBloc();

  //! Repo
  await _setUpRepository();
  //! DataSource
  await _setUpDatasource();
  //! Utils
  await _setUpUtils();
  //!External
  await _setUpExternal();
}

Future<void> _setUpBloc() async {
  serviceLocator.registerLazySingleton(
    () => HomeCubit(
      serviceLocator(),
    ),
  );

  //     // serviceLocator.registerLazySingleton(
  //     //   () => DownloadsCubit(
  //     //     serviceLocator(),
  //     //   ),
  //     // );
  //     // serviceLocator.registerLazySingleton(
  //     //   () => HomeCubit(
  //     //     serviceLocator(),
  //     //   ),
  //     // );

  //     // serviceLocator.registerLazySingleton(
  //     //   () => ProfileCubit(
  //     //     serviceLocator(),
  //     //   ),
  //     // );
  //     // serviceLocator.registerLazySingleton(
  //     //   () => FormsAndQuestionsCubit(
  //     //     serviceLocator(),
  //     //   ),
  //     );
}

Future<void> _setUpRepository() async {
  serviceLocator.registerLazySingleton<HomeRepository>(
    () => HomeRepository(
      remoteDataSource: serviceLocator(),
    ),
  );

  // serviceLocator.registerLazySingleton<HomeRepository>(
  //   () => HomeRepository(
  //     remoteDataSource: serviceLocator(),
  //   ),
  // );
  // serviceLocator.registerLazySingleton<ProfileRepository>(
  //   () => ProfileRepository(
  //     remoteDataSource: serviceLocator(),
  //     localDataSource: serviceLocator(),
  //   ),
  // );
  // serviceLocator.registerLazySingleton<FormsAndQuestionsRepository>(
  //   () => FormsAndQuestionsRepository(
  //     remoteDataSource: serviceLocator(),
  //   ),
  // );
  // serviceLocator.registerLazySingleton<DownloadsRepository>(
  //   () => DownloadsRepository(
  //     remoteDataSource: serviceLocator(),
  //   ),
  // );
}

Future<void> _setUpDatasource() async {
  serviceLocator.registerLazySingleton<HomeRemoteDataSource>(
      () => HomeRemoteDataSource(apiConsumer: serviceLocator()));

  // serviceLocator.registerLazySingleton<ProfileRemoteDataSource>(
  //     () => ProfileRemoteDataSource(serviceLocator()));

  // serviceLocator.registerLazySingleton<HomeRemoteDataSource>(
  //     () => HomeRemoteDataSource(serviceLocator()));
  // serviceLocator.registerLazySingleton<FormsAndQuestionsRemoteDataSource>(
  //     () => FormsAndQuestionsRemoteDataSource(serviceLocator()));
  // serviceLocator.registerLazySingleton<DownloadsRemoteDataSource>(
  //     () => DownloadsRemoteDataSource(serviceLocator()));
}

Future<void> _setUpUtils() async {
  serviceLocator.registerLazySingleton<NetworkInformation>(
    () => NetworkInformationImplementation(
      internetConnectionChecker: serviceLocator(),
    ),
  );
  serviceLocator.registerLazySingleton<ApiConsumer>(
    () => DioConsumer(
      dio: serviceLocator(),
    ),
  );

  serviceLocator.registerLazySingleton<IAppLocalStorage>(
    () => SharedPreferenceLocalStorageImplementation(
      shared: serviceLocator(),
    ),
  );
}

Future<void> _setUpExternal() async {
  //! Inject SharedPreferences
  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  serviceLocator.registerLazySingleton(() => sharedPreferences);

  serviceLocator.registerLazySingleton(() => AppInterceptor());
  serviceLocator.registerLazySingleton(
    () => LogInterceptor(
      request: true,
      requestBody: true,
      requestHeader: true,
      error: true,
      responseBody: true,
      responseHeader: false,
    ),
  );
  serviceLocator.registerLazySingleton(() => Dio());

  serviceLocator.registerLazySingleton(
    () => DioConsumer(
      dio: serviceLocator(),
    ),
  );
}
