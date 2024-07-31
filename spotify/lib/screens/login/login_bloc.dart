import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spotify/base_class/bloc/base_bloc.dart';
import 'package:spotify/base_class/bloc/base_state.dart';
import 'package:spotify/base_class/storage/app_shared_preferences.dart';
import 'package:spotify/base_class/storage/keystore.dart';
import 'package:spotify/data/data.dart';
import 'package:spotify/utils/utils.dart';
import 'login.dart';

class LoginBloc extends BaseBloc {
  LoginBloc(super.initialState, super.context) {
    //on<ExampleEvent>(_exampleEvent);
    on<LoginEvent>(_mapLoginToState);
  }

  Future<void> _mapLoginToState(
    LoginEvent event,
    Emitter<BaseBlocState> emit,
  ) async {
    try {
      TokenRes? token = await appGetToken(event.clientID, event.clientSecret);

      if (token?.accessToken != null) {
        AppSharedPreferences().setSharedPreferences(
          key: KeyStore.IS_LOGGED_IN,
          value: true,
        );
        AppSharedPreferences().setSharedPreferences(
          key: KeyStore.CLIENT_ID,
          value: event.clientID,
        );
        AppSharedPreferences().setSharedPreferences(
          key: KeyStore.CLIENT_SECRET,
          value: event.clientSecret,
        );
        emit(LoginSuccess());
      } else {
        emit(LoginFailure());
      }

      // if (token != null) {
      //   // emit(LoginSuccess());
      //   emit(LoginFailure());
      // } else {
      //   emit(LoginFailure());
      // }
    } catch (e) {
      logger.e(e);
    }
  }
}
