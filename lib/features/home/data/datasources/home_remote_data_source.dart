import '../models/home_summary_model.dart';

class HomeRemoteDataSource {
  Future<HomeSummaryModel> fetchSummary() async {
    return const HomeSummaryModel(title: 'Welcome', subtitle: 'Summary');
  }
}
