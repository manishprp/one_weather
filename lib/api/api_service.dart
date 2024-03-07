import 'package:dio/dio.dart';

import 'api_client.dart';

var _dio = APIClient().init();
checkInternet() async {}

Future<Response?> getService({
  required String url,
}) async {
  try {
    return await _dio.get(
      url,
      options: Options(),
    );
  } on DioException catch (e) {
    final errorMessage = e.toString();
    throw Exception(errorMessage);
  }
}
