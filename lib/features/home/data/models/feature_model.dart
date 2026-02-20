import 'package:democicdapp/features/home/domain/entities/feature.dart';

/// Data model for Feature.
/// This extends the domain entity and adds serialization methods
/// for data layer operations.
class FeatureModel extends Feature {
  const FeatureModel({
    required super.id,
    required super.title,
    required super.description,
    required super.iconName,
    super.releaseDate,
  });

  /// Creates a FeatureModel from JSON map.
  factory FeatureModel.fromJson(Map<String, dynamic> json) {
    return FeatureModel(
      id: json['id'] as String,
      title: json['title'] as String,
      description: json['description'] as String,
      iconName: json['icon_name'] as String,
      releaseDate: json['release_date'] != null
          ? DateTime.parse(json['release_date'] as String)
          : null,
    );
  }

  /// Converts the FeatureModel to a JSON map.
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'icon_name': iconName,
      'release_date': releaseDate?.toIso8601String(),
    };
  }

  /// Creates a FeatureModel from a Feature entity.
  factory FeatureModel.fromEntity(Feature entity) {
    return FeatureModel(
      id: entity.id,
      title: entity.title,
      description: entity.description,
      iconName: entity.iconName,
      releaseDate: entity.releaseDate,
    );
  }
}
