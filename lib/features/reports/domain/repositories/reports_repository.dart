import '../entities/report_entity.dart';

abstract class ReportsRepository {
  Future<List<ReportEntity>> loadReports();
  Future<void> exportReports();
}
