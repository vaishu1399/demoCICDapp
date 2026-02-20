import 'package:democicdapp/features/settings/data/datasources/settings_remote_datasource.dart';
import 'package:democicdapp/features/settings/domain/entities/app_settings.dart';
import 'package:democicdapp/features/settings/domain/repositories/settings_repository.dart';

/// Implementation of [SettingsRepository].
class SettingsRepositoryImpl implements SettingsRepository {
  final SettingsRemoteDataSource remoteDataSource;

  SettingsRepositoryImpl({required this.remoteDataSource});

  @override
  Future<List<AppSettings>> getSettings() async {
    return await remoteDataSource.getSettings();
  }

  @override
  Future<AppSettings?> getSettingById(String id) async {
    return await remoteDataSource.getSettingById(id);
  }
}
