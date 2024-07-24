import 'package:spotify/base_class/bloc/base_bloc_page.dart';
import 'package:spotify/screens/splash_screen/splash_screen_event.dart';
import 'package:spotify/utils/utils.dart';
import 'splash_screen_bloc.dart';
import 'splash_screen_form.dart';
import 'package:flutter/material.dart';

class SplashScreenPage extends BaseBlocPage<SplashScreenBloc> {
  const SplashScreenPage({super.key});

  @override
  Widget getForm() {
    return const SplashScreenForm();
  }

  @override
  SplashScreenBloc myBloc(BuildContext context) {
    return SplashScreenBloc(initialState, context)..add(GetInfoEvent());
  }
}

gotoSplashScreenPage({required BuildContext context}) {
  var data = {};
  Utils().changeScreenNamedWithData(context, "page name", data);
}

SplashScreenPage splashScreenPage(RouteSettings settings) {
  // var arguments = getArguments(settings);
  //var type = arguments["field name"];
  return const SplashScreenPage();
}
