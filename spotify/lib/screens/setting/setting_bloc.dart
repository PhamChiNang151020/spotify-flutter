import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spotify/base_class/bloc/base_bloc.dart';
import 'package:spotify/base_class/bloc/base_state.dart';
import 'package:spotify/data/models/setting_models.dart';
import 'package:spotify/repository/spotify_repository.dart';
import 'setting.dart';

class SettingBloc extends BaseBloc {
  SettingBloc(super.initialState, super.context) {
    //on<ExampleEvent>(_exampleEvent);
    on<SettingInitialEvent>(_mapInitScreenToState);
  }

  // Future<void> _exampleEvent(
  //     CreateEnquiry event,
  //     Emitter<BaseBlocState> emit,
  //     ) async {
  // do something in here
  // }

  Future<void> _mapInitScreenToState(
    SettingInitialEvent event,
    Emitter<BaseBlocState> emit,
  ) async {
    List<SettingModel> listSetting =
        await SpotifyRepository(context).getSetting();

    emit(SettingLoadSuccess(listSetting: listSetting));
  }
}
