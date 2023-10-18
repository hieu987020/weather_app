import 'package:dio/dio.dart';

class BaseProvider {
  static final Dio dio = Dio();
  static String? apiUrl;
  static String? apiKey;

  init({String? url, String? key}) {
    // get api url , shared key from environment file
    apiUrl = url;
    apiKey = key;
    // show log for each api
    dio.interceptors.add(
      LogInterceptor(
        requestBody: true,
        responseBody: true,
      ),
    );
    
  }
}
