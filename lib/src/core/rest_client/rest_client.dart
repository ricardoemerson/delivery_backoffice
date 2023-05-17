import 'package:dio/browser.dart';
import 'package:dio/dio.dart';

import '../env/env.dart';
import '../storage/storage/i_storage.dart';
import 'auth_interceptor.dart';

class RestClient extends DioForBrowser {
  late AuthInterceptor _authInterceptor;
  final IStorage _storage;

  RestClient({
    required IStorage storage,
  })  : _storage = storage,
        super(
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

    _authInterceptor = AuthInterceptor(storage: _storage);
  }

  RestClient authRequest() {
    if (!interceptors.contains(_authInterceptor)) {
      interceptors.add(_authInterceptor);
    }

    return this;
  }

  RestClient publicRequest() {
    interceptors.remove(_authInterceptor);

    return this;
  }
}
