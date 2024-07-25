// ignore_for_file: unused_import

import 'dart:developer';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spotify/base_class/storage/app_shared_preferences.dart';
import 'package:spotify/base_class/storage/keystore.dart';
import 'package:spotify/data/models/token/token_res.dart';
import 'package:spotify/env/env.dart';
import 'package:spotify/screens/splash_screen/splash_screen_event.dart';
import 'package:spotify/screens/splash_screen/splash_screen_state.dart';
import 'package:spotify/utils/utils.dart';

import '../../api/app_config_url.dart';
import '../../base_class/bloc/base_bloc.dart';
import '../../base_class/bloc/base_state.dart';

class SplashScreenBloc extends BaseBloc {
  SplashScreenBloc(super.initialState, super.context) {
    //on<ExampleEvent>(_exampleEvent);
    on<GetInfoEvent>(_getInfo);
  }

  Future<void> _getInfo(
    GetInfoEvent event,
    Emitter<BaseBlocState> emit,
  ) async {
    try {
      // await appGetToken(Env.CLIENT_ID, Env.CLIENT_SECRET);
      await Future.delayed(const Duration(seconds: 1));
      var isLogged = await AppSharedPreferences()
          .getSharedPreferences(key: KeyStore.IS_LOGGED_IN);

      if (isLogged == null) {
        emit(GetInfoSuccess(isLogged: false));
      } else {
        emit(GetInfoSuccess(isLogged: true));
      }
    } catch (e) {
      logger.e(e);
    }
  }
}
