import '../entities/splash_status.dart';
import '../repositories/splash_repository.dart';

class LoadSplashStatus {
  const LoadSplashStatus(this._repository);

  final SplashRepository _repository;

  Future<SplashStatus> call() {
    return _repository.loadStatus();
  }
}
