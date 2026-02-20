import 'package:equatable/equatable.dart';

/// Entity representing a feature in the home screen.
/// This is the core business object used in the domain layer.
class Feature extends Equatable {
  final String id;
  final String title;
  final String description;
  final String iconName;
  final DateTime? releaseDate;

  const Feature({
    required this.id,
    required this.title,
    required this.description,
    required this.iconName,
    this.releaseDate,
  });

  @override
  List<Object?> get props => [id, title, description, iconName, releaseDate];
}
