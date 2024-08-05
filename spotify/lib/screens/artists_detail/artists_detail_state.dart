import 'package:spotify/base_class/bloc/base_state.dart';
import 'package:spotify/data/data.dart';

class ArtistsDetailLoadSuccess extends BaseBlocState {
  final List<ArtistsAlbums> listArtistAlbums;
  final List<Track> listPopularTracks;
  final Artist artist;
  List<Artist> listRelatedArtists;
  final bool isLoading;
  ArtistsDetailLoadSuccess({
    required this.listArtistAlbums,
    required this.listPopularTracks,
    required this.artist,
    required this.listRelatedArtists,
    required this.isLoading,
  });

  ArtistsDetailLoadSuccess copyWith({
    List<ArtistsAlbums>? listArtistAlbums,
    List<Track>? listPopularTracks,
    Artist? artist,
    List<Artist>? listRelatedArtists,
    bool? isLoading,
  }) {
    return ArtistsDetailLoadSuccess(
      listArtistAlbums: listArtistAlbums ?? this.listArtistAlbums,
      listPopularTracks: listPopularTracks ?? this.listPopularTracks,
      artist: artist ?? this.artist,
      listRelatedArtists: listRelatedArtists ?? this.listRelatedArtists,
      isLoading: isLoading ?? this.isLoading,
    );
  }
}
