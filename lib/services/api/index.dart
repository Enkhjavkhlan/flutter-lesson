import 'package:dio/dio.dart';
import 'package:movie/services/api/Interceptor.dart';

class ApiService {
  final Dio dio;
  ApiService()
      : dio = Dio(BaseOptions(
          //baseUrl: "localhost:8000"
          baseUrl: "https://pub.dev",
          receiveTimeout: 30000, //30sec
          sendTimeout: 30000, //30 sec ywahgui bol aldaa
        ))
          ..interceptors.add(CustomInterceptors());

  Future<Response> getRequest(String path, [bool isAuth = false]) async {
    if (isAuth) {
      print("Auth required");
      return dio.get(path,
          options: Options(headers: {"Authhorization": "Bearer SDANDALKSDAD"}));
    } else
      return dio.get(path);
  }

  Future<Response> postRequest(String path,
      {bool isAuth = true, dynamic body}) async {
    if (isAuth) {
      print("Auth required");
      return dio.post(path,
          data: body,
          options: Options(headers: {"Authhorization": "Bearer SDANDALKSDAD"}));
    } else
      return dio.post(path, data: body);
  }

  Future<Response> putRequest(String path,
      {bool isAuth = true, dynamic body}) async {
    if (isAuth) {
      print("Auth required");
      return dio.put(path,
          data: body,
          options: Options(headers: {"Authhorization": "Bearer SDANDALKSDAD"}));
    } else
      return dio.put(path, data: body);
  }

  Future<Response> deleteRequest(String path,
      {bool isAuth = true, dynamic body}) async {
    if (isAuth) {
      print("Auth required");
      return dio.delete(path,
          data: body,
          options: Options(headers: {"Authhorization": "Bearer SDANDALKSDAD"}));
    } else
      return dio.delete(path, data: body);
  }
}
