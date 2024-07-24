import 'package:spotify/base_class/bloc/base_bloc_form_state_full.dart';
import 'package:spotify/base_class/bloc/base_state.dart';
import 'package:spotify/base_class/storage/app_shared_preferences.dart';
import 'package:spotify/base_class/storage/keystore.dart';
import 'package:spotify/common/common.dart';

import 'package:flutter/material.dart';
import 'package:spotify/screens/home/home.dart';
import 'package:spotify/screens/main/main_page.dart';
import 'package:spotify/screens/splash_screen/splash_screen_state.dart';
import 'package:spotify/widgets/svg_png/widget_svg.dart';
import 'splash_screen_bloc.dart';

class SplashScreenForm extends StatefulWidget {
  const SplashScreenForm({super.key});

  @override
  State<SplashScreenForm> createState() => _SplashScreenFormState();
}

class _SplashScreenFormState
    extends BaseBLocFormStateFull<SplashScreenBloc, SplashScreenForm> {
  @override
  Widget getWidget(BuildContext context, BaseBlocState state) {
    // return const Center(
    //   child: Text(
    //     "SPLASH_SCREEN Nef",
    //     style: TextStyle(
    //       fontSize: MySizes.defaultSize,
    //       color: MyColors.defaultColor,
    //     ),
    //   ),
    // );
    return const Center(
      child: SvgWidget(
        assetName: MyAssets.ic_logo,
        width: 200,
        height: 200,
      ),
    );
  }

  @override
  void listener(BuildContext context, BaseBlocState state) {
    if (state is GetInfoSuccess) {
      AppSharedPreferences().getSharedPreferences(key: KeyStore.TOKEN);
      // gotoHomePage(context: context);
      gotoMainPage(context: context);
    }
  }
}
