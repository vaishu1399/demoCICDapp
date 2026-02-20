import 'package:democicdapp/core/usecases/usecase.dart';
import 'package:democicdapp/features/settings/domain/entities/app_settings.dart';
import 'package:democicdapp/features/settings/domain/repositories/settings_repository.dart';

/// Use case to get the list of app settings.
class GetSettings implements UseCase<List<AppSettings>, NoParams> {
  final SettingsRepository repository;

  GetSettings(this.repository);

  @override
  Future<List<AppSettings>> call(NoParams params) async {
    return await repository.getSettings();
  }
}
