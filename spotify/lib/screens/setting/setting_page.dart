import 'package:spotify/base_class/bloc/base_bloc_page.dart';
import 'package:spotify/utils/screen_key.dart';
import 'package:spotify/utils/utils.dart';
import 'package:spotify/base_class/router.dart';
import 'package:flutter/material.dart';
import 'setting.dart';

class SettingPage extends BaseBlocPage<SettingBloc> {
  const SettingPage({super.key});

  @override
  Widget getForm() {
    return const SettingForm();
  }

  @override
  SettingBloc myBloc(BuildContext context) {
    return SettingBloc(initialState, context)..add(SettingInitialEvent());
  }
}

gotoSettingPage({required BuildContext context}) {
  var data = {};
  Utils().changeScreenNamedWithData(context, SETTING_SCREEN, data);
}

SettingPage settingPage(RouteSettings settings) {
  var arguments = getArguments(settings);
  //var type = arguments["field name"];
  return const SettingPage();
}
