import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class BaseApiClient {
  late Dio _dio;

  BaseApiClient() {
    _dio = Dio(BaseOptions(
        baseUrl: 'https://api.themoviedb.org/3/')); // Create Dio instance
    _initializeInterceptors();
  }

  // Method to initialize interceptors (e.g., headers, error handling)
  void _initializeInterceptors() {
    String apiToken = dotenv.env['API_TOKEN']!;
    _dio.interceptors.add(InterceptorsWrapper(
      onRequest: (options, handler) {
        options.headers['Authorization'] = 'Bearer $apiToken';
        return handler.next(options);
      },
      onError: (DioError e, handler) {
        // Handle errors globally or based on status codes
        return handler.next(e);
      },
    ));
  }

  // Method to make GET request
  Future<Response> get(String path,
      {Map<String, dynamic>? queryParameters}) async {
    return _dio.get(path, queryParameters: queryParameters);
  }

  // Method to make POST request
  Future<Response> post(String path, dynamic data) async {
    return _dio.post(path, data: data);
  }
}
