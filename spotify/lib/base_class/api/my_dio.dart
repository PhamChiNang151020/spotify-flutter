import 'package:dio/dio.dart';

class DioInterceptor extends Interceptor {
  Dio dio = Dio(BaseOptions(baseUrl: "base-api-url"));
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    // TODO: implement onRequest
    super.onRequest(options, handler);
  }
}
