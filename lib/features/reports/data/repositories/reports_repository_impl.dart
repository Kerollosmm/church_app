import '../../domain/entities/report_entity.dart';
import '../../domain/repositories/reports_repository.dart';
import '../datasources/reports_remote_data_source.dart';

class ReportsRepositoryImpl implements ReportsRepository {
  const ReportsRepositoryImpl(this._remoteDataSource);

  final ReportsRemoteDataSource _remoteDataSource;

  @override
  Future<List<ReportEntity>> loadReports() async {
    await _remoteDataSource.fetchReports();
    return const [];
  }

  @override
  Future<void> exportReports() async {}
}
