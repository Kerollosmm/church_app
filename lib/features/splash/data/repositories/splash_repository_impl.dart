import '../../domain/entities/splash_status.dart';
import '../../domain/repositories/splash_repository.dart';
import '../datasources/splash_local_data_source.dart';

class SplashRepositoryImpl implements SplashRepository {
  const SplashRepositoryImpl(this._localDataSource);

  final SplashLocalDataSource _localDataSource;

  @override
  Future<SplashStatus> loadStatus() async {
    final model = await _localDataSource.loadStatus();
    return SplashStatus(isAuthenticated: model.isAuthenticated);
  }
}
