
import 'package:dio/dio.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:template_flutter_test/shared/api/api_config.dart';

final apiAppProvider = Provider<Dio>((ref) {
  final dio = Dio(
    BaseOptions(
      baseUrl: ApiConfig.apiAppUrl,
      headers: ApiConfig.headers,
      connectTimeout: Duration(milliseconds: ApiConfig.timeout),
    ),
  );

  dio.interceptors.add(
    InterceptorsWrapper(

      // TODO: INTEGRAR LOS TOAST PARA NOTIFICAR
      onRequest: (options, handler) {
        print('Request: ${options.path}');
        return handler.next(options);
      },
      onResponse: (response, handler) {
        print('Response: ${response.data}');
        return handler.next(response);
      },
      onError: (error, handler) {
        print('Error: ${error.message}');
        return handler.next(error);
      },
    ),
  );

  return dio;
});