import 'package:spotify/base_class/bloc/base_state.dart';
import 'package:spotify/data/data.dart';

import '../../data/models/artists/artists_detail_model.dart';

class ArtistsDetailLoadSuccess extends BaseBlocState {
  final List<ArtistsAlbums> listArtistAlbums;
  final List<ArtistsAlbums> listPopularTracks;
  final Artist artist;
  final bool isLoading;
  ArtistsDetailLoadSuccess({
    required this.listArtistAlbums,
    required this.listPopularTracks,
    required this.artist,
    required this.isLoading,
  });

  ArtistsDetailLoadSuccess copyWith({
    List<ArtistsAlbums>? listArtistAlbums,
    List<ArtistsAlbums>? listPopularTracks,
    Artist? artist,
    bool? isLoading,
  }) {
    return ArtistsDetailLoadSuccess(
      listArtistAlbums: listArtistAlbums ?? this.listArtistAlbums,
      listPopularTracks: listPopularTracks ?? this.listPopularTracks,
      artist: artist ?? this.artist,
      isLoading: isLoading ?? this.isLoading,
    );
  }
}
