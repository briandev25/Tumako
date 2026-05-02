import 'package:dio/dio.dart';

class ApiClient {
  static final Dio _dio = _createDio();

  static Dio _createDio() {
    final dio = Dio(
      BaseOptions(
        baseUrl: "http://localhost:3000",
        connectTimeout: Duration(seconds: 5),
        receiveTimeout: Duration(seconds: 3),
        headers: {"Content-Type": "application/json"},
      ),
    );

    dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) {
          return handler.next(options);
        },
        onResponse: (response, handler) {
          print("Status: ${response.statusCode}");
          print("Data: ${response.data}");
          return handler.next(response);
        },
        onError: (error, handler) {
          print("status: ${error.response?.statusCode}");
          print("message:${error.message}");
          return handler.next(error);
        },
      ),
    );
    return dio;
  }
}
