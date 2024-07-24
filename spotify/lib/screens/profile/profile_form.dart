import 'package:spotify/base_class/bloc/base_bloc_form_state_full.dart';
import 'package:spotify/base_class/bloc/base_state.dart';

import 'package:flutter/material.dart';
import 'profile.dart';

class ProfileForm extends StatefulWidget {
  const ProfileForm({super.key});

  @override
  State<ProfileForm> createState() => _ProfileFormState();
}

class _ProfileFormState
    extends BaseBLocFormStateFull<ProfileBloc, ProfileForm> {
  @override
  Widget getWidget(BuildContext context, BaseBlocState state) {
    return const Scaffold(
      body: Text("Profile SCREEN"),
    );
  }

  @override
  void listener(BuildContext context, BaseBlocState state) {
    // TODO: implement listener
  }
}
