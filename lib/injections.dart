import 'package:easy_story_flutter/iam/iam.dart';
import 'package:easy_story_flutter/publishing/application/publishing_service.dart';
import 'package:easy_story_flutter/publishing/infrastructure/data_sources/write_local_data_provider.dart';
import 'package:easy_story_flutter/publishing/infrastructure/data_sources/write_remote_data_provider.dart';
import 'package:easy_story_flutter/publishing/infrastructure/repositories/write_repository.dart';
import 'package:easy_story_flutter/publishing/presentation/publishing_create_edit_posts/bloc/write_bloc.dart';
import 'package:get_it/get_it.dart';

final serviceLocator = GetIt.instance;

// From Top To bottom
Future<void> init() async {
  // iam
  iamDependencies();
  publishingDependencies();
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

//publishing
Future<void> publishingDependencies() async {
  // Presentation Layer - Blocs
  serviceLocator.registerFactory(
    () => WriteDetailBloc(
      writeService: serviceLocator(),
    ),
  );

  // Application Layer - facades
  serviceLocator.registerLazySingleton(
    () => PublishingService(
      repository: serviceLocator(),
    ),
  );

  // Infrastructure Layer
  // repositories
  serviceLocator.registerLazySingleton(
    () => WriteRepository(
      connectivity: serviceLocator(),
      writeLocalDataProvider: serviceLocator(),
      writeRemoteDataProvider: serviceLocator(),
    ),
  );
  //data sources
  serviceLocator.registerLazySingleton(
    () => WriteLocalDataProvider(),
  );
  serviceLocator.registerLazySingleton(
    () => WriteRemoteDataProvider(),
  );
}
