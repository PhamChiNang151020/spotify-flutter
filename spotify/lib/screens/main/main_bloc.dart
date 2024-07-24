import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spotify/base_class/bloc/base_bloc.dart';
import 'package:spotify/base_class/bloc/base_state.dart';

import 'main.dart';

class MainBloc extends BaseBloc {
  MainBloc(super.initialState, super.context) {
    on<MainInitScreen>(_mapInitScreenToState);
    on<MainSelectScreen>(_mapSelectScreenToState);
  }

  Future<void> _mapInitScreenToState(
    MainInitScreen event,
    Emitter<BaseBlocState> emit,
  ) async {
    emit(MainScreenLoadSuccess(indexPage: event.index));
  }

  Future<void> _mapSelectScreenToState(
    MainSelectScreen event,
    Emitter<BaseBlocState> emit,
  ) async {
    final currentState = state;
    if (currentState is MainScreenLoadSuccess) {
      emit(currentState.copyWith(indexPage: event.index));
    } else {
      emit(MainScreenLoadSuccess(indexPage: event.index));
    }
  }
}
