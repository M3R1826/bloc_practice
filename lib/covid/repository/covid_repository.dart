import 'package:bloc_arch_test/covid/api/covid_api.dart';
import 'package:bloc_arch_test/covid/model/covid_model.dart';

class ApiRepository {
  final _provider = ApiProvider();

  Future<CovidModel> fetchCovidList() {
    return _provider.fetchCovidList();
  }
}

class NetworkError extends Error {}
