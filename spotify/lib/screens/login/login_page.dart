import 'package:spotify/base_class/bloc/base_bloc_page.dart';
import 'package:spotify/utils/screen_key.dart';
import 'package:spotify/utils/utils.dart';
import 'package:spotify/base_class/router.dart';
import 'package:flutter/material.dart';
import 'login.dart';

class LoginPage extends BaseBlocPage<LoginBloc> {
  const LoginPage({super.key});

  @override
  Widget getForm() {
    return const LoginForm();
  }

  @override
  LoginBloc myBloc(BuildContext context) {
    return LoginBloc(initialState, context);
  }
}

gotoLoginPage({required BuildContext context}) {
  var data = {};
  Utils().changeScreenNamedWithData(context, LOGIN_SCREEN, data);
}

LoginPage loginPage(RouteSettings settings) {
  var arguments = getArguments(settings);
  //var type = arguments["field name"];
  return const LoginPage();
}
