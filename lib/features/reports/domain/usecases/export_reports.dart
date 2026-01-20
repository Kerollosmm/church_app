import '../repositories/reports_repository.dart';

class ExportReports {
  const ExportReports(this._repository);

  final ReportsRepository _repository;

  Future<void> call() {
    return _repository.exportReports();
  }
}
