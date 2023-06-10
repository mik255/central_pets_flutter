abstract class IHttpClient {
  Future<HttpResponse> get(HttpRequest request);

  Future<HttpResponse> post(HttpRequest request);

  Future<HttpResponse> delete(HttpRequest request);

  Future<HttpResponse> patch(HttpRequest request);

  Future<HttpResponse> put(HttpRequest request);
}

class BaseUrl {
  BaseUrl(this.url);
   String url;
}
class HttpRequest{
  HttpRequest({
    required this.route,
    required this.body,
  });
  String route;
  Map<String, dynamic> body;
}

class HttpResponse{
  HttpResponse({
    required this.statusCode,
    required this.data,
  });

  int statusCode;
  Map<String, dynamic> data;
}
