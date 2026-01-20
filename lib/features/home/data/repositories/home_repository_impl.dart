import '../../domain/entities/home_summary.dart';
import '../../domain/repositories/home_repository.dart';
import '../datasources/home_remote_data_source.dart';

class HomeRepositoryImpl implements HomeRepository {
  const HomeRepositoryImpl(this._remoteDataSource);

  final HomeRemoteDataSource _remoteDataSource;

  @override
  Future<HomeSummary> loadSummary() async {
    final model = await _remoteDataSource.fetchSummary();
    return HomeSummary(title: model.title, subtitle: model.subtitle);
  }
}
