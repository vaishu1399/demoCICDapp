import 'package:democicdapp/core/usecases/usecase.dart';
import 'package:democicdapp/features/home/domain/entities/feature.dart';
import 'package:democicdapp/features/home/domain/repositories/home_repository.dart';

/// Use case to get the list of upcoming features.
/// This encapsulates the business logic for retrieving features.
class GetUpcomingFeatures implements UseCase<List<Feature>, NoParams> {
  final HomeRepository repository;

  GetUpcomingFeatures(this.repository);

  @override
  Future<List<Feature>> call(NoParams params) async {
    return await repository.getUpcomingFeatures();
  }
}
