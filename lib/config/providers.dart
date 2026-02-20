import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:democicdapp/features/home/data/datasources/home_remote_datasource.dart';
import 'package:democicdapp/features/home/data/repositories/home_repository_impl.dart';
import 'package:democicdapp/features/home/domain/repositories/home_repository.dart';
import 'package:democicdapp/features/home/domain/usecases/get_upcoming_features.dart';
import 'package:democicdapp/features/settings/data/datasources/settings_remote_datasource.dart';
import 'package:democicdapp/features/settings/data/repositories/settings_repository_impl.dart';
import 'package:democicdapp/features/settings/domain/repositories/settings_repository.dart';
import 'package:democicdapp/features/settings/domain/usecases/get_settings.dart';

// ============================================================================
// Home Feature Providers
// ============================================================================

/// Provider for the home remote data source.
final homeRemoteDataSourceProvider = Provider<HomeRemoteDataSource>((ref) {
  return HomeRemoteDataSourceImpl(delay: 800);
});

/// Provider for the home repository.
final homeRepositoryProvider = Provider<HomeRepository>((ref) {
  final dataSource = ref.watch(homeRemoteDataSourceProvider);
  return HomeRepositoryImpl(remoteDataSource: dataSource);
});

/// Provider for the get upcoming features use case.
final getUpcomingFeaturesUseCaseProvider = Provider<GetUpcomingFeatures>((ref) {
  final repository = ref.watch(homeRepositoryProvider);
  return GetUpcomingFeatures(repository);
});

// ============================================================================
// Settings Feature Providers
// ============================================================================

/// Provider for the settings remote data source.
final settingsRemoteDataSourceProvider = Provider<SettingsRemoteDataSource>((
  ref,
) {
  return SettingsRemoteDataSourceImpl(delay: 800);
});

/// Provider for the settings repository.
final settingsRepositoryProvider = Provider<SettingsRepository>((ref) {
  final dataSource = ref.watch(settingsRemoteDataSourceProvider);
  return SettingsRepositoryImpl(remoteDataSource: dataSource);
});

/// Provider for the get settings use case.
final getSettingsUseCaseProvider = Provider<GetSettings>((ref) {
  final repository = ref.watch(settingsRepositoryProvider);
  return GetSettings(repository);
});
