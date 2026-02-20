import 'package:democicdapp/features/home/domain/entities/feature.dart';

/// Abstract repository interface for home feature.
/// This defines the contract that the data layer must implement.
abstract class HomeRepository {
  /// Gets the list of upcoming features.
  /// Returns a list of [Feature] objects.
  Future<List<Feature>> getUpcomingFeatures();

  /// Gets a specific feature by its ID.
  /// Returns a [Feature] object if found.
  Future<Feature?> getFeatureById(String id);
}
