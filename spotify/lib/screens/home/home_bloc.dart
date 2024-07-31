import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spotify/base_class/bloc/base_bloc.dart';
import 'package:spotify/base_class/bloc/base_state.dart';
import 'package:spotify/data/data.dart';
import 'package:spotify/repository/spotify_repository.dart';
import 'package:spotify/utils/utils.dart';

import 'home.dart';

class HomeBloc extends BaseBloc {
  HomeBloc(super.initialState, super.context) {
    //on<ExampleEvent>(_exampleEvent);
    on<HomeGetNewRelease>(_mapGetNewReleaseToState);
    on<HomeRefreshEvent>(_mapRefreshToState);
  }

  Future<void> _mapGetNewReleaseToState(
    HomeGetNewRelease event,
    Emitter<BaseBlocState> emit,
  ) async {
    var resSeveralNewRelease = await SpotifyRepository(context).getNewRelease();
    var resSeveralArtists = await SpotifyRepository(context).getArtists();
    var resSeveralShow = await SpotifyRepository(context).getSeveralShow();

    List<ItemSpotify>? listItem = [];
    List<Artist>? listArtist = [];
    List<Show>? listShow = [];
    if (resSeveralNewRelease != null) {
      listItem = resSeveralNewRelease.albums.items;
    }

    if (resSeveralArtists != null) {
      listArtist = resSeveralArtists.artists;
    }

    if (resSeveralShow != null) {
      listShow = resSeveralShow.shows;
    }
    emit(HomeLoadSuccess(
      isLoadingAlbum: false,
      isLoadingArtist: false,
      isLoadingShow: false,
      listAlbum: listItem,
      listArtist: listArtist,
      listShow: listShow,
    ));
  }

  Future<void> _mapRefreshToState(
    HomeRefreshEvent event,
    Emitter<BaseBlocState> emit,
  ) async {
    try {
      final currentState = state;
      if (currentState is HomeLoadSuccess) {
        var resSeveralNewRelease =
            await SpotifyRepository(context).getNewRelease();
        var resSeveralArtists = await SpotifyRepository(context).getArtists();
        var resSeveralShow = await SpotifyRepository(context).getSeveralShow();

        List<ItemSpotify>? listItem = [];
        List<Artist>? listArtist = [];
        List<Show>? listShow = [];
        if (resSeveralNewRelease != null) {
          listItem = resSeveralNewRelease.albums.items;
        }

        if (resSeveralArtists != null) {
          listArtist = resSeveralArtists.artists;
        }

        if (resSeveralShow != null) {
          listShow = resSeveralShow.shows;
        }

        emit(currentState.copyWith(
          listAlbum: listItem,
          listArtist: listArtist,
          listShow: listShow,
          isLoadingAlbum: false,
          isLoadingArtist: false,
          isLoadingShow: false,
        ));
      }
    } catch (e) {
      logger.e(e);
    }
  }
}
