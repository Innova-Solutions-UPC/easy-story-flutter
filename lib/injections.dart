import 'package:easy_story_flutter/iam/iam.dart';
import 'package:get_it/get_it.dart';

final serviceLocator = GetIt.instance;

// From Top To bottom
Future<void> init() async {
  // iam
  iamDependencies();

  // sales
}

Future<void> iamDependencies() async {
  // Presentation Layer - Blocs
  serviceLocator.registerFactory(
    () => IamDetailBloc(
      iamService: serviceLocator(),
    ),
  );

  // Application Layer - facades
  serviceLocator.registerLazySingleton(
    () => IamService(
      repository: serviceLocator(),
    ),
  );

  // Infrastructure Layer
  // repositories
  serviceLocator.registerLazySingleton(
    () => IamRepository(
      connectivity: serviceLocator(),
      iamLocalDataProvider: serviceLocator(),
      iamRemoteDataProvider: serviceLocator(),
    ),
  );
  //data sources
  serviceLocator.registerLazySingleton(
    () => IamLocalDataProvider(),
  );
  serviceLocator.registerLazySingleton(
    () => IamRemoteDataProvider(),
  );

  // Common and core
  serviceLocator.registerLazySingleton(
    () => Connectivity(),
  );
}
