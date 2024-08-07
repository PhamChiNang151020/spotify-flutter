import 'dart:developer';

import 'package:dio/dio.dart';
import 'dart:io';
import 'package:dio/io.dart';
import 'package:spotify/api/app_config_url.dart';
import 'package:spotify/base_class/storage/app_shared_preferences.dart';
import 'package:spotify/base_class/storage/keystore.dart';
import 'package:spotify/data/data.dart';
import 'package:spotify/utils/utils.dart';

Future<void> configDio(Dio dio) async {
  if (Platform.isAndroid) {
    dio.httpClientAdapter = IOHttpClientAdapter(
      createHttpClient: () {
        // Don't trust any certificate just because their root cert is trusted.
        final HttpClient client =
            HttpClient(context: SecurityContext(withTrustedRoots: false));
        // You can test the intermediate / root cert here. We just ignore it.
        client.badCertificateCallback = (cert, host, port) => true;
        return client;
      },
    );
  }

  dio.options.baseUrl = AppConfigUrl.BASE_URL;
  // dio.interceptors.add(LogInterceptor(
  //   requestHeader: true,
  //   requestBody: true,
  //   responseBody: true,

  // ));
  var auth =
      await AppSharedPreferences().getSharedPreferences(key: KeyStore.TOKEN);
  dio.interceptors.add(InterceptorsWrapper(
    onRequest: (options, handler) async {
      var auth = await AppSharedPreferences()
          .getSharedPreferences(key: KeyStore.TOKEN);
      options.headers["Authorization"] = auth;
      return handler.next(options);
    },
    onResponse: (response, handler) {
      return handler.next(response);
    },
    onError: (DioException e, handler) async {
      if (e.response?.statusCode == 401) {
        // Token has expired, refresh it
        RequestOptions options = e.requestOptions;
        try {
          String clientId = await AppSharedPreferences()
              .getSharedPreferences(key: KeyStore.CLIENT_ID);
          String clientSecret = await AppSharedPreferences()
              .getSharedPreferences(key: KeyStore.CLIENT_SECRET);

          await appGetToken(clientId, clientSecret);

          options.headers["Authorization"] = auth;

          // Retry the request with the new token
          final response = await dio.fetch(options);
          return handler.resolve(response);
        } catch (err) {
          return handler.reject(e);
        }
      }
      return handler.next(e);
    },
  ));
  dio.options.connectTimeout = const Duration(seconds: 40);

  // * Add token if authentication by header is enabled
  // var token = await AppSharedPreferences().getSharedPreferences(TOKEN);

  // dio.options.headers["x-access-token"] = token;
  dio.options.headers["Authorization"] = auth;
}
