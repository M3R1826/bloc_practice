import 'package:bloc_arch_test/covid/model/covid_model.dart';
import 'package:dio/dio.dart';

class ApiProvider {
  final Dio _dio = Dio();
  final String _url = 'https://api.covid19api.com/summary';

  Future<CovidModel> fetchCovidList() async {
    try {
      Response response = await _dio.get(_url);
      return CovidModel.fromJson(response.data);
    } catch (error) {
      return CovidModel.withError("Data not found / Connection issue");
    }
  }
}
