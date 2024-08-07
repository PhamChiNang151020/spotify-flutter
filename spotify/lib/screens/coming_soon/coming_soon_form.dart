import 'package:spotify/base_class/bloc/base_bloc_form_full_app_bar.dart';
import 'package:spotify/base_class/bloc/base_bloc_form_state_full.dart';
import 'package:spotify/base_class/bloc/base_state.dart';
import 'package:flutter/material.dart';
import 'coming_soon_bloc.dart';

class ComingSoonForm extends StatefulWidget {
  const ComingSoonForm({super.key});

  @override
  State<ComingSoonForm> createState() => _ComingSoonFormState();
}

class _ComingSoonFormState
    extends BaseBLocFormStateFullAppBar<ComingSoonBloc, ComingSoonForm> {
  @override
  Widget getWidget(BuildContext context, BaseBlocState state) {
    return const Center(
      child: Text("COMING SOON"),
    );
  }

  @override
  void listener(BuildContext context, BaseBlocState state) {}

  @override
  Widget getTitle() {
    return const Text("Coming Soon");
  }
}
