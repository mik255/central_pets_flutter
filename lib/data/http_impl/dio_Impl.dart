import 'package:event_driver_arch/domain/http/abstract_http.dart';
import 'package:dio/dio.dart';

import 'interceptor.dart';
class DioImpl implements IHttpClient{
  DioImpl({required this.baseUrl}){
    HttpInterceptor interceptor = HttpInterceptor();
    dio = Dio();
    dio.interceptors.add(InterceptorsWrapper(
      onRequest: (options, handler) {
        print('baseUrl: ${options.baseUrl}${options.path}');
        interceptor.onRequest(HttpRequest(route: options.path??'', body: options.data));
        return handler.next(options);
      },
      onResponse: (response, handler) {
        interceptor.onResponse(HttpResponse(statusCode: response.statusCode??0, data: response.data));
        return handler.next(response);
      },
      onError: (DioError e, handler) {
        print('error: ${e.message}');
        return handler.next(e);
      },
    ));
  }
  final String baseUrl;
  late Dio dio;

  @override
  Future<HttpResponse> delete(HttpRequest request) {
    // TODO: implement delete
    throw UnimplementedError();
  }

  @override
  Future<HttpResponse> get(HttpRequest request) {
    // TODO: implement get
    throw UnimplementedError();
  }

  @override
  Future<HttpResponse> patch(HttpRequest request) {
    // TODO: implement patch
    throw UnimplementedError();
  }

  @override
  Future<HttpResponse> post(HttpRequest request) async{
    var response = await dio.fetch(
        RequestOptions(
          baseUrl: baseUrl,
          path:
        request.route,
          method: 'POST',
          headers: {
            'Content-Type': 'application/json',
          },
          data: request.body,
        ));
    return HttpResponse(statusCode: response.statusCode??0, data: response.data);
  }

  @override
  Future<HttpResponse> put(HttpRequest request) {
    // TODO: implement put
    throw UnimplementedError();
  }




}