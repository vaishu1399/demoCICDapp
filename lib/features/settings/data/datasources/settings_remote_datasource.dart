import 'package:democicdapp/features/settings/data/models/settings_model.dart';

/// Abstract data source for settings feature.
abstract class SettingsRemoteDataSource {
  Future<List<SettingsModel>> getSettings();
  Future<SettingsModel?> getSettingById(String id);
}

/// Implementation of [SettingsRemoteDataSource].
class SettingsRemoteDataSourceImpl implements SettingsRemoteDataSource {
  final int delay;

  SettingsRemoteDataSourceImpl({this.delay = 500});

  @override
  Future<List<SettingsModel>> getSettings() async {
    await Future.delayed(Duration(milliseconds: delay));

    return const [
      SettingsModel(
        id: '1',
        title: 'Dark Mode',
        description: 'Switch between light and dark themes.',
        iconName: 'dark_mode',
        releaseDate: null,
      ),
      SettingsModel(
        id: '2',
        title: 'Notifications',
        description: 'Configure push notifications and alerts.',
        iconName: 'notifications',
        releaseDate: null,
      ),
      SettingsModel(
        id: '3',
        title: 'Privacy Settings',
        description: 'Manage your privacy and data preferences.',
        iconName: 'privacy_tip',
        releaseDate: null,
      ),
    ];
  }

  @override
  Future<SettingsModel?> getSettingById(String id) async {
    await Future.delayed(Duration(milliseconds: delay));
    final settings = await getSettings();
    try {
      return settings.firstWhere((s) => s.id == id);
    } catch (_) {
      return null;
    }
  }
}
