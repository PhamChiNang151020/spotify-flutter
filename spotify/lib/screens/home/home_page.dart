import 'package:spotify/base_class/bloc/base_bloc_page.dart';
import 'package:spotify/utils/screen_key.dart';
import 'package:spotify/utils/utils.dart';
import 'package:spotify/base_class/router.dart';
import 'package:flutter/material.dart';
import 'home.dart';

class HomePage extends BaseBlocPage<HomeBloc> {
  const HomePage({super.key});

  @override
  Widget getForm() {
    return const HomeForm();
  }

  @override
  HomeBloc myBloc(BuildContext context) {
    return HomeBloc(initialState, context);
  }
}

gotoHomePage({required BuildContext context}) {
  var data = {};
  Utils().changeScreenNamedWithData(context, HOME_SCREEN, data);
}

HomePage homePage(RouteSettings settings) {
  // var arguments = getArguments(settings);
  //var type = arguments["field name"];
  return const HomePage();
}
