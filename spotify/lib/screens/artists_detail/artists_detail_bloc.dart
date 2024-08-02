import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spotify/base_class/bloc/base_bloc.dart';
import 'package:spotify/base_class/bloc/base_state.dart';
import 'package:spotify/repository/spotify_repository.dart';
import 'package:spotify/utils/utils.dart';
import '../../data/models/artists/artists_detail_model.dart';
import 'artists_detail.dart';

class ArtistsDetailBloc extends BaseBloc {
  ArtistsDetailBloc(super.initialState, super.context) {
    //on<ExampleEvent>(_exampleEvent);
    on<GetArtistsDetailEvent>(_mapArtistsDetailToState);
  }

  Future<void> _mapArtistsDetailToState(
    GetArtistsDetailEvent event,
    Emitter<BaseBlocState> emit,
  ) async {
    try {
      // * CALL API
      List<ArtistsAlbums> listArtistAlbums = [];
      List<ArtistsAlbums> listPopularTracks = [];
      var res =
          await SpotifyRepository(context).getArtistsDetail(event.artists.id!);
      if (res != null) {
        listPopularTracks =
            res.items.sublist(0, res.items.length > 5 ? 5 : res.items.length);
        listArtistAlbums = res.items;
      }

      emit(ArtistsDetailLoadSuccess(
        listPopularTracks: listPopularTracks,
        listArtistAlbums: listArtistAlbums,
        artist: event.artists,
        isLoading: false,
      ));
    } catch (e) {
      logger.e(e);
    }
  }
}
