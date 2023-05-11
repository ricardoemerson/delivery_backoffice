import 'package:dio/browser.dart';
import 'package:dio/dio.dart';

import '../env/env.dart';

class RestClient extends DioForBrowser {
  RestClient()
      : super(
          BaseOptions(
            baseUrl: Env.instance.get('BACKEND_BASE_URL'),
            connectTimeout: const Duration(seconds: 5),
            receiveTimeout: const Duration(seconds: 60),
          ),
        ) {
    interceptors.add(
      LogInterceptor(
        requestBody: true,
        responseBody: true,
      ),
    );
  }

  RestClient authRequest() {
    return this;
  }

  RestClient publicRequest() {
    return this;
  }
}
