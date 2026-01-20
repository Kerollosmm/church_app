import '../entities/report_entity.dart';
import '../repositories/reports_repository.dart';

class LoadReports {
  const LoadReports(this._repository);

  final ReportsRepository _repository;

  Future<List<ReportEntity>> call() {
    return _repository.loadReports();
  }
}
