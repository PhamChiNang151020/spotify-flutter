import 'dart:developer';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:spotify/api/app_config_url.dart';
import 'package:spotify/base_class/storage/app_shared_preferences.dart';
import 'package:spotify/base_class/storage/keystore.dart';
import 'package:spotify/data/models/token/token_res.dart';

class Utils {
  static final Utils _singleton = Utils._internal();

  factory Utils() {
    return _singleton;
  }

  Utils._internal();

  changeScreenStateFulWidget(
      BuildContext context, StatefulWidget statefulWidget) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => statefulWidget),
    );
  }

  changeScreenStatelessWidget(
      BuildContext context, StatelessWidget statelessWidget) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => statelessWidget),
    );
  }

  changeScreenWithNamed(BuildContext context, String named) {
    Navigator.pushNamed(context, named);
  }

  changeScreenAndRemoveWithNamed(BuildContext context, String named) {
    Navigator.of(context)
        .pushNamedAndRemoveUntil(named, (Route<dynamic> route) => false);
  }

  changeScreenAndReplaceWithNamed(BuildContext context, String named,
      {dynamic data}) {
    Navigator.restorablePushReplacementNamed(context, named, arguments: data);
  }

  popBack(BuildContext context) {
    Navigator.of(context).pop();
  }

  popUntilWithCountCheck(BuildContext context, int countCheck) {
    var count = 0;
    Navigator.popUntil(context, (route) {
      return count++ == countCheck;
    });
  }

  changeScreenAndRemoveWithNamedData(
      BuildContext context, String named, dynamic object) {
    Navigator.of(context).pushNamedAndRemoveUntil(
        named, (Route<dynamic> route) => false,
        arguments: object);
  }

  changeScreenNamedWithData(
      BuildContext context, String named, dynamic object) {
    Navigator.pushNamed(context, named, arguments: object);
  }

  changeScreenNamedWithDataAndWait(
      BuildContext context, String named, dynamic object) async {
    return await Navigator.pushNamed(context, named, arguments: object);
  }

  clearFocus(BuildContext context) {
    FocusScope.of(context).unfocus();
  }
}

void printDebug(String string) {
  if (kDebugMode) {
    // print(string);
    log(string);
  }
}

var logger = Logger(
  printer: PrettyPrinter(),
);

Future<TokenRes?> appGetToken(
  String clientId,
  String clientSecret,
) async {
  try {
    final Dio dio = Dio();
    final response = await dio.post(
      AppConfigUrl.TOKEN,
      options: Options(
        headers: {
          HttpHeaders.contentTypeHeader: 'application/x-www-form-urlencoded',
        },
      ),
      data: {
        'grant_type': 'client_credentials',
        'client_id': clientId,
        'client_secret': clientSecret,
      },
    );

    if (response.statusCode == 200) {
      TokenRes tokenRes = TokenRes.fromJson(response.data);

      AppSharedPreferences().setSharedPreferences(
        key: KeyStore.TOKEN,
        value: "${tokenRes.tokenType} ${tokenRes.accessToken}",
      );
      return tokenRes;
    } else {
      logger.w('Failed to get token. Status code: ${response.statusCode}');
      return null;
    }
  } on DioException catch (e) {
    logger.e('Error getting token: $e');
  }
  return null;
}

EdgeInsets getPaddingSafeArea(BuildContext context) {
  return MediaQuery.of(context).padding;
}
