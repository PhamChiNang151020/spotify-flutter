import 'package:spotify/base_class/bloc/base_bloc_page.dart';
import 'package:spotify/utils/screen_key.dart';
import 'package:spotify/utils/utils.dart';
import 'package:spotify/base_class/router.dart';
import 'package:flutter/material.dart';
import 'notification.dart';

class NotificationPage extends BaseBlocPage<NotificationBloc> {
  const NotificationPage({super.key});

  @override
  Widget getForm() {
    return const NotificationForm();
  }

  @override
  NotificationBloc myBloc(BuildContext context) {
    return NotificationBloc(initialState, context);
  }
}

gotoNotificationPage({required BuildContext context}) {
  var data = {};
  Utils().changeScreenNamedWithData(context, NOTIFICATION_SCREEN, data);
}

NotificationPage notificationPage(RouteSettings settings) {
  var arguments = getArguments(settings);
  //var type = arguments["field name"];
  return const NotificationPage();
}
