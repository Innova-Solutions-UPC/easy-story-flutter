import 'package:easy_story_flutter/iam/iam.dart';
import 'package:easy_story_flutter/profile/application/profile_service.dart';
import 'package:easy_story_flutter/profile/infrastructure/data_sources/profile_local_data_provider.dart';
import 'package:easy_story_flutter/profile/infrastructure/data_sources/profile_remote_data_provider.dart';
import 'package:easy_story_flutter/profile/infrastructure/repositories/profile_repository.dart';
import 'package:easy_story_flutter/profile/presentation/profile/bloc/profile_detail_bloc.dart';
import 'package:easy_story_flutter/publishing/application/publishing_service.dart';
import 'package:easy_story_flutter/publishing/infrastructure/data_sources/write_local_data_provider.dart';
import 'package:easy_story_flutter/publishing/infrastructure/data_sources/write_remote_data_provider.dart';
import 'package:easy_story_flutter/publishing/infrastructure/repositories/write_repository.dart';
import 'package:easy_story_flutter/publishing/presentation/publishing_create_edit_posts/bloc/write_bloc.dart';
import 'package:easy_story_flutter/social/application/social_service.dart';
import 'package:easy_story_flutter/social/infrastructure/data_sources/social_local_data_provider.dart';
import 'package:easy_story_flutter/social/infrastructure/data_sources/social_remote_data_provider.dart';
import 'package:easy_story_flutter/social/infrastructure/repositories/social_repository.dart';
import 'package:easy_story_flutter/social/presentation/bookmarks/bloc/bloc.dart';
import 'package:easy_story_flutter/social/presentation/comments/bloc/bloc.dart';
import 'package:easy_story_flutter/social/presentation/qualifications/bloc/bloc.dart';
import 'package:get_it/get_it.dart';

final serviceLocator = GetIt.instance;

// From Top To bottom
Future<void> init() async {
  //iam
  InsertIamDependencies();
  //publishing
  InsertPublishingDependencies();
  //profile
  InsertProfileDependencies();
  //social
  InsertSocialDependencies();
}

Future<void> InsertIamDependencies() async {
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
Future<void> InsertPublishingDependencies() async {
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

//profile
Future<void> InsertProfileDependencies() async {
  // Presentation Layer - Blocs
  serviceLocator.registerFactory(
    () => ProfileDetailBloc(
      profileService: serviceLocator(),
    ),
  );

  // Application Layer - facades
  serviceLocator.registerLazySingleton(
    () => ProfileService(
      repository: serviceLocator(),
    ),
  );

  // Infrastructure Layer
  // repositories
  serviceLocator.registerLazySingleton(
    () => ProfileRepository(
      connectivity: serviceLocator(),
      profileLocalDataProvider: serviceLocator(),
      profileRemoteDataProvider: serviceLocator(),
    ),
  );
  //data sources
  serviceLocator.registerLazySingleton(
    () => ProfileLocalDataProvider(),
  );
  serviceLocator.registerLazySingleton(
    () => ProfileRemoteDataProvider(),
  );
}

Future<void> InsertSocialDependencies() async {
  // Presentation Layer - Blocs
  serviceLocator.registerFactory(
    () => SocialCommentDetailBloc(
      socialService: serviceLocator(),
    ),
  );
  serviceLocator.registerFactory(
    () => SocialQualificationDetailBloc(
      socialService: serviceLocator(),
    ),
  );
  serviceLocator.registerFactory(
    () => SocialBookmarkDetailBloc(
      socialService: serviceLocator(),
    ),
  );

  // Application Layer - facades
  serviceLocator.registerLazySingleton(
    () => SocialService(
      repository: serviceLocator(),
    ),
  );

  // Infrastructure Layer
  // repositories
  serviceLocator.registerLazySingleton(
    () => SocialRepository(
      connectivity: serviceLocator(),
      socialLocalDataProvider: serviceLocator(),
      socialRemoteDataProvider: serviceLocator(),
    ),
  );
  //data sources
  serviceLocator.registerLazySingleton(
    () => SocialLocalDataProvider(),
  );
  serviceLocator.registerLazySingleton(
    () => SocialRemoteDataProvider(),
  );

  // Common and core
  serviceLocator.registerLazySingleton(
    () => Connectivity(),
  );
}
