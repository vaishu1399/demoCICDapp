import 'package:democicdapp/features/settings/domain/entities/app_settings.dart';

/// Abstract repository interface for settings feature.
abstract class SettingsRepository {
  /// Gets the list of app settings.
  Future<List<AppSettings>> getSettings();

  /// Gets a specific setting by ID.
  Future<AppSettings?> getSettingById(String id);
}
