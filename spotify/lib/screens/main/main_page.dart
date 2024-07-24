import 'package:spotify/base_class/bloc/base_bloc_page.dart';
import 'package:spotify/utils/screen_key.dart';
import 'package:spotify/utils/utils.dart';

import 'package:flutter/material.dart';
import 'main.dart';

class MainPage extends BaseBlocPage<MainBloc> {
  const MainPage({super.key});

  @override
  Widget getForm() {
    return const MainForm();
  }

  @override
  MainBloc myBloc(BuildContext context) {
    return MainBloc(initialState, context)..add(MainInitScreen(index: 0));
  }
}

gotoMainPage({required BuildContext context}) {
  var data = {};
  Utils().changeScreenNamedWithData(context, MAIN_SCREEN, data);
}

MainPage mainPage(RouteSettings settings) {
  //var type = arguments["field name"];
  return const MainPage();
}
