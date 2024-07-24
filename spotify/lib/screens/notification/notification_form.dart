import 'package:spotify/base_class/bloc/base_bloc_form_state_full.dart';
import 'package:spotify/base_class/bloc/base_state.dart';

import 'package:flutter/material.dart';
import 'notification.dart';

class NotificationForm extends StatefulWidget {
  const NotificationForm({super.key});

  @override
  State<NotificationForm> createState() => _NotificationFormState();
}

class _NotificationFormState
    extends BaseBLocFormStateFull<NotificationBloc, NotificationForm> {
  @override
  Widget getWidget(BuildContext context, BaseBlocState state) {
    return const Text("Notification");
  }

  @override
  void listener(BuildContext context, BaseBlocState state) {
    // TODO: implement listener
  }
}
