import '../entities/splash_status.dart';

abstract class SplashRepository {
  Future<SplashStatus> loadStatus();
}
