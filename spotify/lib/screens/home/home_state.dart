import 'package:spotify/base_class/bloc/base_state.dart';

import '../../data/data.dart';

class HomeInitial extends BaseBlocState {}

class HomeLoadSuccess extends BaseBlocState {
  final List<ItemSpotify>? listAlbum;
  final List<Artist>? listArtist;
  final List<Show>? listShow;
  final bool isLoadingAlbum;
  final bool isLoadingArtist;
  final bool isLoadingShow;
  HomeLoadSuccess({
    this.listAlbum,
    this.listArtist,
    this.listShow,
    required this.isLoadingAlbum,
    required this.isLoadingArtist,
    required this.isLoadingShow,
  });

  HomeLoadSuccess copyWith({
    List<ItemSpotify>? listAlbum,
    List<Artist>? listArtist,
    List<Show>? listShow,
    bool? isLoadingAlbum,
    bool? isLoadingArtist,
    bool? isLoadingShow,
  }) {
    return HomeLoadSuccess(
      listAlbum: listAlbum ?? this.listAlbum,
      listArtist: listArtist ?? this.listArtist,
      listShow: listShow ?? this.listShow,
      isLoadingAlbum: isLoadingAlbum ?? this.isLoadingAlbum,
      isLoadingArtist: isLoadingArtist ?? this.isLoadingArtist,
      isLoadingShow: isLoadingShow ?? this.isLoadingShow,
    );
  }
}
