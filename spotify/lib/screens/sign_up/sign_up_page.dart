import 'package:spotify/base_class/bloc/base_bloc_page.dart';
import 'package:spotify/utils/screen_key.dart';
import 'package:spotify/utils/utils.dart';
import 'package:spotify/base_class/router.dart';
import 'package:flutter/material.dart';
import 'sign_up.dart';

class SignUpPage extends BaseBlocPage<SignUpBloc> {
  const SignUpPage({super.key});

  @override
  Widget getForm() {
    return const SignUpForm();
  }

  @override
  SignUpBloc myBloc(BuildContext context) {
    return SignUpBloc(initialState, context);
  }
}

gotoSignUpPage({required BuildContext context}) {
  var data = {};
  Utils().changeScreenNamedWithData(context, SIGN_UP_SCREEN, data);
}

SignUpPage signUpPage(RouteSettings settings) {
  var arguments = getArguments(settings);
  //var type = arguments["field name"];
  return const SignUpPage();
}
