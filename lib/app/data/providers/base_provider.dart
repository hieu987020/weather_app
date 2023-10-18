import 'dart:developer';

import 'package:dio/dio.dart';

class BaseProvider {
  static final Dio dio = Dio();
  static String? apiUrl;
  static String? apiKey;

  init({String? url, String? key}) {
    // get api url , shared key from environment file
    apiUrl = url;
    apiKey = key;

    // dio.interceptors.clear();

    // show log for each api
    dio.interceptors.add(
      LogInterceptor(
        requestBody: true,
        responseBody: true,
      ),
    );
    // log error and handle error
    dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) {
          handler.next(options);
        },
        onResponse: (response, handler) {
          handler.next(response);
        },
        onError: (error, handler) async {
          try {
            log("Dio Error:");
            log(error.response.toString());
            log(error.error.toString());
            log(error.message ?? "");
            handler.reject(error);
          } catch (_) {
            log(_.toString());
            handler.reject(error);
          }
        },
      ),
    );
  }
}
