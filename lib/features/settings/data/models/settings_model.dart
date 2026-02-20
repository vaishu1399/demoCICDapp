import 'package:democicdapp/features/settings/domain/entities/app_settings.dart';

/// Data model for AppSettings.
class SettingsModel extends AppSettings {
  const SettingsModel({
    required super.id,
    required super.title,
    required super.description,
    required super.iconName,
    super.releaseDate,
  });

  factory SettingsModel.fromJson(Map<String, dynamic> json) {
    return SettingsModel(
      id: json['id'] as String,
      title: json['title'] as String,
      description: json['description'] as String,
      iconName: json['icon_name'] as String,
      releaseDate: json['release_date'] != null
          ? DateTime.parse(json['release_date'] as String)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'icon_name': iconName,
      'release_date': releaseDate?.toIso8601String(),
    };
  }

  factory SettingsModel.fromEntity(AppSettings entity) {
    return SettingsModel(
      id: entity.id,
      title: entity.title,
      description: entity.description,
      iconName: entity.iconName,
      releaseDate: entity.releaseDate,
    );
  }
}
