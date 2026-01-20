import '../entities/home_summary.dart';
import '../repositories/home_repository.dart';

class LoadHomeSummary {
  const LoadHomeSummary(this._repository);

  final HomeRepository _repository;

  Future<HomeSummary> call() {
    return _repository.loadSummary();
  }
}
