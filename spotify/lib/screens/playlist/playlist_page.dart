import 'package:spotify/base_class/bloc/base_bloc_page.dart';
import 'package:spotify/utils/screen_key.dart';
import 'package:spotify/utils/utils.dart';
import 'package:spotify/base_class/router.dart';
import 'package:flutter/material.dart';
import 'playlist.dart';

class PlaylistPage extends BaseBlocPage<PlaylistBloc> {
  const PlaylistPage({super.key});

  @override
  Widget getForm() {
    return const PlaylistForm();
  }

  @override
  PlaylistBloc myBloc(BuildContext context) {
    return PlaylistBloc(initialState, context);
  }
}

gotoPlaylistPage({required BuildContext context}) {
  var data = {};
  Utils().changeScreenNamedWithData(context, PLAYLIST_SCREEN, data);
}

PlaylistPage playlistPage(RouteSettings settings) {
  var arguments = getArguments(settings);
  //var type = arguments["field name"];
  return const PlaylistPage();
}
