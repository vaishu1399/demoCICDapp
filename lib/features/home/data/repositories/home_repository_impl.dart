import 'package:democicdapp/features/home/data/datasources/home_remote_datasource.dart';
import 'package:democicdapp/features/home/domain/entities/feature.dart';
import 'package:democicdapp/features/home/domain/repositories/home_repository.dart';

/// Implementation of [HomeRepository].
/// This class implements the repository interface defined in the domain layer
/// and uses the data source to fetch and transform data.
class HomeRepositoryImpl implements HomeRepository {
  final HomeRemoteDataSource remoteDataSource;

  HomeRepositoryImpl({required this.remoteDataSource});

  @override
  Future<List<Feature>> getUpcomingFeatures() async {
    final featureModels = await remoteDataSource.getUpcomingFeatures();
    // In a real app, we might transform the data here
    // For now, we just return the models which extend Feature
    return featureModels;
  }

  @override
  Future<Feature?> getFeatureById(String id) async {
    return await remoteDataSource.getFeatureById(id);
  }
}
