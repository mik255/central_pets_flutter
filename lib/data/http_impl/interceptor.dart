

import 'package:event_driver_arch/domain/http/abstract_http.dart';

class HttpInterceptor{
  onRequest(HttpRequest request){
    print('request: ${request.route}');
    print('request: ${request.body}');
  }
  onResponse(HttpResponse response){
    print('response: ${response.statusCode}');
    print('response: ${response.data}');
  }

}