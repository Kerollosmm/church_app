import '../models/splash_status_model.dart';

class SplashLocalDataSource {
  Future<SplashStatusModel> loadStatus() async {
    return const SplashStatusModel(isAuthenticated: false);
  }
}
