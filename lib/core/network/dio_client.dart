import 'package:dio/dio.dart';
import 'package:logger/logger.dart';

class DioClient {
  final Dio dio;
  final logger = Logger();

  static const String _baseUrl = 'https://api.thecatapi.com/v1';
  static const String _apiKey = 'live_99Qe4Ppj34NdplyLW67xCV7Ds0oSLKGgcWWYnSzMJY9C0QOu0HUR4azYxWkyW2nr';

  DioClient() : dio = Dio(BaseOptions(
    baseUrl: _baseUrl,
    connectTimeout: const Duration(seconds: 30),
    receiveTimeout: const Duration(seconds: 30),
  )) {
    dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) {
          options.headers['x-api-key'] = _apiKey;
          logger.d('Request: ${options.method} ${options.path}');
          return handler.next(options);
        },
        onResponse: (response, handler) {
          logger.d('Response: ${response.statusCode} ${response.requestOptions.path}');
          return handler.next(response);
        },
        onError: (DioException e, handler) {
          logger.e('Error: ${e.message}\n${e.response?.data}');
          return handler.next(e);
        },
      ),
    );
  }
}
