import 'package:dio/dio.dart';
import 'api_constants.dart';

class WeatherEndpointProvider {
  Dio _client;

  WeatherEndpointProvider(this._client);
  checkInternet() async {}

  Future<Response> fetchCurrentWeather(double lat, double lon) async {
    try {
      var apikey = ApiConstants.apiKey;
      final response = await _client
          .get('data/2.5/weather?lat=$lat&lon=$lon&appid=$apikey&units=metric');
      return response;
    } on DioException catch (ex) {
      String errorMessage = ex.response?.data["message"] ?? "";
      throw Exception(errorMessage);
    }
  }
}
