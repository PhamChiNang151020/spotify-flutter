import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spotify/base_class/bloc/base_bloc.dart';
import 'package:spotify/base_class/bloc/base_state.dart';
import 'package:spotify/data/models/tracks/popular_tracks_model.dart';
import 'package:spotify/repository/spotify_repository.dart';
import 'package:spotify/utils/utils.dart';
import '../../data/models/artists/artists_detail_model.dart';
import '../../data/models/models.dart';
import 'artists_detail.dart';

class ArtistsDetailBloc extends BaseBloc {
  ArtistsDetailBloc(super.initialState, super.context) {
    //on<ExampleEvent>(_exampleEvent);
    on<GetArtistsDetailEvent>(_mapArtistsDetailToState);
    on<RefreshArtistsDetailEvent>(_mapRefreshArtistsDetailToState);
  }

  Future<void> _mapArtistsDetailToState(
    GetArtistsDetailEvent event,
    Emitter<BaseBlocState> emit,
  ) async {
    try {
      // * CALL API
      List<ArtistsAlbums> listArtistAlbums = [];
      List<Track> listPopularTracks = [];
      List<Artist> listRelatedArtists = [];

      var res =
          await SpotifyRepository(context).getArtistsDetail(event.artists.id!);
      var resPopularTracks =
          await SpotifyRepository(context).getPopularTracks(event.artists.id!);
      var resRelatedArtists =
          await SpotifyRepository(context).getRelatedArtists(event.artists.id!);

      if (res != null) {
        listArtistAlbums = res.items;
      }

      if (resPopularTracks != null) {
        listPopularTracks = resPopularTracks.tracks;
      }

      if (resRelatedArtists != null) {
        listRelatedArtists = resRelatedArtists.artists;
      }

      emit(ArtistsDetailLoadSuccess(
        listPopularTracks: listPopularTracks,
        listArtistAlbums: listArtistAlbums,
        artist: event.artists,
        listRelatedArtists: listRelatedArtists,
        isLoading: false,
      ));
    } catch (e) {
      logger.e(e);
    }
  }

  Future<void> _mapRefreshArtistsDetailToState(
    RefreshArtistsDetailEvent event,
    Emitter<BaseBlocState> emit,
  ) async {
    try {
      final currentState = state;
      if (currentState is ArtistsDetailLoadSuccess) {
        List<ArtistsAlbums> listArtistAlbums = [];
        List<Track> listPopularTracks = [];
        List<Artist> listRelatedArtists = [];

        var res = await SpotifyRepository(context)
            .getArtistsDetail(event.artists.id!);
        var resPopularTracks = await SpotifyRepository(context)
            .getPopularTracks(event.artists.id!);
        var resRelatedArtists = await SpotifyRepository(context)
            .getRelatedArtists(event.artists.id!);

        if (res != null) {
          listArtistAlbums = res.items;
        }

        if (resPopularTracks != null) {
          listPopularTracks = resPopularTracks.tracks;
        }

        if (resRelatedArtists != null) {
          listRelatedArtists = resRelatedArtists.artists;
        }
        emit(currentState.copyWith(
          listPopularTracks: listPopularTracks,
          listArtistAlbums: listArtistAlbums,
          artist: event.artists,
          listRelatedArtists: listRelatedArtists,
          isLoading: false,
        ));

        // emit(ArtistsDetailLoadSuccess(
        //   listPopularTracks: listPopularTracks,
        //   listArtistAlbums: listArtistAlbums,
        //   artist: event.artists,
        //   listRelatedArtists: listRelatedArtists,
        //   isLoading: false,
        // ));
      } else {
        logger.e("Can not refresh");
      }
      // * CALL API
    } catch (e) {
      logger.e(e);
    }
  }
}
