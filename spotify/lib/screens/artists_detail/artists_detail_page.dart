import 'package:spotify/base_class/bloc/base_bloc_page.dart';
import 'package:spotify/base_class/router.dart';
import 'package:spotify/data/models/artists/artists_model.dart';
import 'package:spotify/utils/screen_key.dart';
import 'package:spotify/utils/utils.dart';
import 'package:flutter/material.dart';
import 'artists_detail.dart';

class ArtistsDetailPage extends BaseBlocPage<ArtistsDetailBloc> {
  const ArtistsDetailPage(this.artist, {super.key});

  final Artist artist;

  @override
  Widget getForm() {
    return const ArtistsDetailForm();
  }

  @override
  ArtistsDetailBloc myBloc(BuildContext context) {
    return ArtistsDetailBloc(initialState, context)
      ..add(GetArtistsDetailEvent(
        artists: artist,
      ));
  }
}

void gotoArtistsDetailPage({
  required BuildContext context,
  required Artist artist,
}) {
  var data = artist.toJson();
  Utils().changeScreenNamedWithData(context, ARTISTS_DETAIL_SCREEN, data);
}

ArtistsDetailPage artistsDetailPage(RouteSettings settings) {
  var arguments = getArguments(settings);

  Artist artist = Artist.fromJson(arguments as Map<String, dynamic>);

  return ArtistsDetailPage(artist);
}
