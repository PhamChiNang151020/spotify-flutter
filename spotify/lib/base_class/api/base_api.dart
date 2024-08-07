// ignore_for_file: unused_field, constant_identifier_names

import 'dart:developer';

import 'package:spotify/api/app_config_url.dart';
import 'package:spotify/api/app_error_code.dart';
import 'package:spotify/base_class/api/base_response.dart';
import 'package:spotify/common/status_code.dart';
import 'package:spotify/screens/login/login_page.dart';
import 'package:spotify/utils/internet_helper.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:spotify/utils/utils.dart';

import '../../widgets/popups/popups.dart';
import 'config_dio.dart';

enum RequestMethod { POST, GET, PUT, DELETE, PATCH }

abstract class BaseApi<T> {
  final Dio _dio = Dio();
  Map<String, dynamic>? data;
  String? jsonEndCodeData;
  FormData? formData;
  late final BuildContext context;
  String setUrl = "";
  String path = "";
  BaseResponse _baseResponse = BaseResponse({});
  Response? _response;
  DioException? _dioError;
  T? result;

  BaseResponse get baseResponse => _baseResponse;

  DioException? get dioError => _dioError;

  //* An abstract method to get the request method (GET, POST, PUT, DELETE, PATCH).
  RequestMethod getRequestMethod();

  // * An abstract method to get the URL of the request.
  String getUrl();

  //* An abstract method to convert JSON data into the T data type.
  T convertJson(Map<String, dynamic> mapJson);

  //? ============================== METHOD ====================================

  @protected
  bool isAutoHandleResponse() {
    return true;
  }

  @protected
  bool isAutoShowMessageError() {
    return true;
  }

  @protected
  bool isAutoHandleDioException() {
    return true;
  }

  @protected
  bool isShowLoading() {
    return true;
  }

  @protected
  bool isAutoShowMessage() {
    return true;
  }

  @protected
  bool isEndCodeJsonData() {
    return false;
  }

  @protected
  Future<T?> execute({Map<String, dynamic>? data, String? path}) async {
    this.data = data;
    this.path = path ?? "";
    await run();
    return result;
  }

  BaseApi(this.context) {
    configDio(_dio);
  }

  //? =============================== SET ======================================

  _setDataErrorBaseResponse({required int errorCode, String? errorMessage}) {
    // _baseResponse.code = errorCode;
    // _baseResponse.message = errorMessage;
  }

  _showPopupNoInternet() {
    if (isAutoShowMessage()) {
      PopupNoInternet().show(context);
    }
  }

  _showMessageError(String messageError) {
    if (isAutoShowMessage() && isAutoShowMessageError()) {
      PopupError().show(context, title: "", content: messageError);
    }
  }

  _showLoading() {
    if (isShowLoading()) {
      PopupLoading().show(context);
    }
  }

  _hideLoading() {
    PopupLoading().hide();
  }

  _showErrorSomethingWentWrong() {
    if (isAutoShowMessage()) {
      PopupError().show(context,
          title: "ERROR",
          content:
              AppErrorCode.getMessageError(AppErrorCode.SOMETHING_WENT_WRONG));
    }
  }

  _showMessageErrorWithTile({
    required String title,
    required String messageError,
  }) {
    if (isAutoShowMessage()) {
      PopupError().show(context, title: title, content: messageError);
    }
  }

  String _getFinalUrl() {
    String url = getUrl();
    if (path.isNotEmpty) {
      //* Use Path with param
      url = "$url$path";
    }
    if (getUrl().isEmpty) {
      url = setUrl;
    }

    return url;
  }

  run() async {
    var isConnectInternet = await InternetHelper().isConnectInternet();

    if (!isConnectInternet) {
      log("NO INTERNET CONNECTION");
      _setDataErrorBaseResponse(
        errorCode: AppErrorCode.INTERNET_NOT_CONNECTION,
        errorMessage: "",
      );
      _showPopupNoInternet();
      return;
    }

    if (setUrl.isEmpty && getUrl().isEmpty) {
      _setDataErrorBaseResponse(
        errorCode: AppErrorCode.REQUEST_URL_EMPTY,
        errorMessage: "",
      );
      _showMessageError(
          AppErrorCode.getMessageError(AppErrorCode.REQUEST_URL_EMPTY));
      return;
    }

    if (data != null) {
      data?.keys.where((k) => data?[k] == null).toList().forEach(data!.remove);
    }

    switch (getRequestMethod()) {
      case RequestMethod.POST:
        await post();
      case RequestMethod.GET:
        await get();
      case RequestMethod.PUT:
        await put();
      case RequestMethod.DELETE:
        await delete();
        break;
      case RequestMethod.PATCH:
        await patch();
        break;
    }

    _hideLoading();
  }

  //*  ======================= INIT METHOD =======================
  get() async {
    try {
      Response response;
      String url = _getFinalUrl();
      Options options = Options(
        headers: this._dio.options.headers,
        method: this._dio.options.method,
      );

      if (data != null) {
        response = await _dio.get(url, queryParameters: data);
      } else {
        response = await _dio.get(url);
        _showLoading();
      }
      _logRequestInfo(url: "${AppConfigUrl.BASE_URL}$url", res: response);
      _handleResponse(response);
    } on DioException catch (error) {
      _handleErrorRequest(error);
    }
  }

  post() async {
    try {
      Response response;
      String url = _getFinalUrl();
      if (formData != null) {
        response = await _dio.post(url, data: formData);
      } else if (jsonEndCodeData != null) {
        response = await _dio.post(url,
            data: jsonEndCodeData,
            options: Options(contentType: Headers.jsonContentType));
      } else {
        response = await _dio.post(url,
            data: data, options: Options(contentType: Headers.jsonContentType));
      }
      _logRequestInfo(url: "${AppConfigUrl.BASE_URL}$url", res: response);
      _handleResponse(response);
    } on DioException catch (error) {
      _handleErrorRequest(error);
    }
  }

  delete() async {
    try {
      Response response;
      String url = _getFinalUrl();
      if (formData != null) {
        response = await _dio.delete(url, data: formData);
      } else if (jsonEndCodeData != null) {
        response = await _dio.delete(url,
            data: jsonEndCodeData,
            options: Options(contentType: Headers.jsonContentType));
      } else {
        response = await _dio.delete(url,
            data: data, options: Options(contentType: Headers.jsonContentType));
      }
      _logRequestInfo(url: "${AppConfigUrl.BASE_URL}$url", res: response);
      _handleResponse(response);
    } on DioException catch (error) {
      _handleErrorRequest(error);
    }
  }

  put() async {
    try {
      Response response;
      String url = _getFinalUrl();
      if (formData != null) {
        response = await _dio.put(url, data: formData);
      } else if (jsonEndCodeData != null) {
        response = await _dio.put(url,
            data: jsonEndCodeData,
            options: Options(contentType: Headers.jsonContentType));
      } else {
        response = await _dio.put(url,
            data: data, options: Options(contentType: Headers.jsonContentType));
      }
      _logRequestInfo(url: "${AppConfigUrl.BASE_URL}$url", res: response);
      _handleResponse(response);
    } on DioException catch (error) {
      _handleErrorRequest(error);
    }
  }

  Future<dynamic> patch() async {
    try {
      Response response;
      String url = _getFinalUrl();
      if (formData != null) {
        response = await _dio.patch(url, data: formData);
      } else if (jsonEndCodeData != null) {
        response = await _dio.patch(url,
            data: jsonEndCodeData,
            options: Options(contentType: Headers.jsonContentType));
      } else {
        response = await _dio.patch(url,
            data: data, options: Options(contentType: Headers.jsonContentType));
      }
      _logRequestInfo(url: "${AppConfigUrl.BASE_URL}$url", res: response);
      return _handleResponse(response);
    } on DioException catch (error) {
      return _handleErrorRequest(error);
    }
  }

  void _logRequestInfo({
    required String url,
    required Response<dynamic> res,
  }) {
    print(
        "┏━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ API ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┓ ");
    var options = _getOptions();

    myPrint("URL:     $url");
    myPrint("Method:  ${options.method}");
    myPrint("Headers: ${options.headers}");

    myPrint("\n$res\n");
    if (data != null) {}
    print(
        "┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┛ ");
  }

  Options _getOptions() {
    return Options(
      headers: _dio.options.headers,
      method: _dio.options.method,
      responseType: ResponseType.json,
    );
  }

  void myPrint(String messages) {
    print("|   $messages");
  }

  //* ========================= HANDLE RESPONSES =========================
  _handleResponse(Response response) {
    _hideLoading();
    if (isAutoHandleResponse()) {
      try {
        // _baseResponse = BaseResponse<T>.fromJson(response.data);
        // _baseResponse = response.data;
        result = convertJson(baseResponse.data);
      } catch (error) {
        log("ERROR === ${error.toString()}", name: "RESPONSE");
        _showErrorSomethingWentWrong();
      }
    } else {
      if (response.statusCode == StatusCode.OK) {
        return result = convertJson(response.data);
      } else {
        _showMessageError("An error occurred: ${response.statusCode}");
      }
      // return _response = response;
    }
  }

  _handleErrorRequest(DioException error) async {
    _hideLoading();
    _dioError = error;
    if (isAutoHandleDioException()) {
      if (error.type == DioExceptionType.connectionTimeout ||
          error.type == DioExceptionType.receiveTimeout) {
        _showMessageError(
            AppErrorCode.getMessageError(AppErrorCode.CONNECTION_TIME_OUT));
        return;
      }
      if (error.type == DioExceptionType.unknown) {
        if (error.error
            .toString()
            .contains("SocketException: Connection failed")) {
          return;
        }
        _showErrorSomethingWentWrong();
        return;
      }
      if (error.response?.statusCode == null) {
        _showErrorSomethingWentWrong();
        return;
      } else if (error.response?.statusCode == StatusCode.UNAUTHENTICATED) {
        _showMessageErrorWithTile(
          title: "Sign in Failure",
          messageError:
              AppErrorCode.getMessageError(AppErrorCode.TOKEN_INVALID_CODE),
        );

        //log out
        return;
      }
      if (error.message!.contains("SocketException: Connection failed ")) {}
      _showErrorSomethingWentWrong();
    }
  }
}
// if(_baseResponse.){}

// if (_baseResponse.code == AppErrorCode.SUCCESS) {
//   if (T == bool) {
//     result = (_baseResponse.code == AppErrorCode.SUCCESS) as T?;
//   } else {
//     result = convertJson(baseResponse.data);
//   }
// }
//  else if (baseResponse.code == AppErrorCode.TOKEN_INVALID) {
//   //log out
// } else if (baseResponse.code == AppErrorCode.EMAIL_IS_EXIST) {
//   _showMessageError(
//       AppErrorCode.getMessageError(AppErrorCode.EMAIL_IS_EXIST));
// } else if (baseResponse.code == AppErrorCode.SERVER_ERROR) {
//   _showMessageError(
//       AppErrorCode.getMessageError(AppErrorCode.SERVER_ERROR));
// } else {
//   _showMessageError(_baseResponse.message ??
//       AppErrorCode.getMessageError(AppErrorCode.SOMETHING_WENT_WRONG));
// }
