import 'package:get_it/get_it.dart';
import 'package:dio/dio.dart';

import '../../data/datasources/moment_remote_datasource.dart';
import '../../data/repositories/moment_repository_impl.dart';
import '../../domain/repositories/moment_repository.dart';
import '../../domain/usecases/get_moments.dart';
import '../../presentation/bloc/moment_bloc.dart';

final sl = GetIt.instance;

Future<void> init() async {
  // Dio
  sl.registerLazySingleton(() => Dio());

  // DataSource
  sl.registerLazySingleton(() => MomentRemoteDataSource(sl()));

  // Repository
  sl.registerLazySingleton<MomentRepository>(() => MomentRepositoryImpl(sl()));

  // UseCase
  sl.registerLazySingleton(() => GetMoments(sl()));

  // Bloc
  sl.registerFactory(() => MomentBloc(sl()));
}
