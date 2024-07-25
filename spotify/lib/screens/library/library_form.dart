import 'package:spotify/base_class/bloc/base_bloc_form_state_full.dart';
import 'package:spotify/base_class/bloc/base_state.dart';

import 'package:flutter/material.dart';
import 'library.dart';


class LibraryForm extends StatefulWidget {
  const LibraryForm({super.key});

  @override
  State<LibraryForm> createState() => _LibraryFormState();
}

class _LibraryFormState extends BaseBLocFormStateFull<LibraryBloc, LibraryForm> {
  @override
  Widget getWidget(BuildContext context, BaseBlocState state) {
    return Container();
  }

  @override
  void listener(BuildContext context, BaseBlocState state) {
    // TODO: implement listener
  }
}
    