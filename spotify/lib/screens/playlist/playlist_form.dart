import 'package:spotify/base_class/bloc/base_bloc_form_state_full.dart';
import 'package:spotify/base_class/bloc/base_state.dart';

import 'package:flutter/material.dart';
import 'playlist.dart';


class PlaylistForm extends StatefulWidget {
  const PlaylistForm({super.key});

  @override
  State<PlaylistForm> createState() => _PlaylistFormState();
}

class _PlaylistFormState extends BaseBLocFormStateFull<PlaylistBloc, PlaylistForm> {
  @override
  Widget getWidget(BuildContext context, BaseBlocState state) {
    return Container();
  }

  @override
  void listener(BuildContext context, BaseBlocState state) {
    // TODO: implement listener
  }
}
    