import 'package:democicdapp/features/home/data/models/feature_model.dart';

/// Abstract data source for home feature.
/// Defines the contract for fetching feature data.
abstract class HomeRemoteDataSource {
  /// Fetches the list of upcoming features from the remote source.
  Future<List<FeatureModel>> getUpcomingFeatures();

  /// Fetches a specific feature by ID.
  Future<FeatureModel?> getFeatureById(String id);
}

/// Implementation of [HomeRemoteDataSource].
/// In a real app, this would make HTTP calls to a backend server.
/// For demo purposes, it returns mock data.
class HomeRemoteDataSourceImpl implements HomeRemoteDataSource {
  // Simulated network delay in milliseconds
  final int delay;

  HomeRemoteDataSourceImpl({this.delay = 500});

  @override
  Future<List<FeatureModel>> getUpcomingFeatures() async {
    // Simulate network delay
    await Future.delayed(Duration(milliseconds: delay));

    // Mock data - in production, this would be an API call
    return const [
      FeatureModel(
        id: '1',
        title: 'Advanced Analytics',
        description:
            'Get detailed insights into your data with our new analytics dashboard.',
        iconName: 'analytics',
        releaseDate: null,
      ),
      FeatureModel(
        id: '2',
        title: 'Cloud Sync',
        description:
            'Sync your data across all devices with secure cloud storage.',
        iconName: 'cloud_sync',
        releaseDate: null,
      ),
      FeatureModel(
        id: '3',
        title: 'AI Assistant',
        description:
            'Let our AI help you make better decisions with smart suggestions.',
        iconName: 'smart_toy',
        releaseDate: null,
      ),
    ];
  }

  @override
  Future<FeatureModel?> getFeatureById(String id) async {
    // Simulate network delay
    await Future.delayed(Duration(milliseconds: delay));

    // Get all features and find by ID
    final features = await getUpcomingFeatures();
    try {
      return features.firstWhere((f) => f.id == id);
    } catch (_) {
      return null;
    }
  }
}
