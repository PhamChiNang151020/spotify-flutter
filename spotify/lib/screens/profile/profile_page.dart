import 'package:spotify/base_class/bloc/base_bloc_page.dart';
import 'package:spotify/utils/screen_key.dart';
import 'package:spotify/utils/utils.dart';
import 'package:spotify/base_class/router.dart';
import 'package:flutter/material.dart';
import 'profile.dart';

class ProfilePage extends BaseBlocPage<ProfileBloc> {
  const ProfilePage({super.key});

  @override
  Widget getForm() {
    return const ProfileForm();
  }

  @override
  ProfileBloc myBloc(BuildContext context) {
    return ProfileBloc(initialState, context);
  }
}

gotoProfilePage({required BuildContext context}) {
  var data = {};
  Utils().changeScreenNamedWithData(context, PROFILE_SCREEN, data);
}

ProfilePage profilePage(RouteSettings settings) {
  var arguments = getArguments(settings);
  //var type = arguments["field name"];
  return const ProfilePage();
}
