// import 'package:fertility/page/log_in/log_in_page.dart';
import 'package:spotify/screens/artists_detail/artists_detail.dart';
import 'package:spotify/screens/coming_soon/coming_soon_page.dart';
import 'package:spotify/screens/home/home.dart';
import 'package:spotify/screens/library/library_page.dart';
import 'package:spotify/screens/login/login.dart';
import 'package:spotify/screens/main/main_page.dart';
import 'package:spotify/screens/playlist/playlist.dart';

import 'package:spotify/screens/profile/profile_page.dart';
import 'package:spotify/screens/search/search.dart';
import 'package:spotify/screens/setting/setting.dart';
import 'package:spotify/screens/sign_up/sign_up_page.dart';
import 'package:spotify/screens/splash_screen/splash_screen_page.dart';
import 'package:spotify/utils/screen_key.dart';

import 'package:flutter/material.dart';

PageRouteBuilder routerWithData(RouteSettings settings) {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) {
      switch (settings.name) {
        case SPLASH_SCREEN:
          return splashScreenPage(settings);
        case LOGIN_SCREEN:
          return loginPage(settings);
        case SIGN_UP_SCREEN:
          return signUpPage(settings);
        case MAIN_SCREEN:
          return mainPage(settings);
        case HOME_SCREEN:
          return homePage(settings);
        case SEARCH_SCREEN:
          return searchPage(settings);
        case LIBRARY_SCREEN:
          return libraryPage(settings);
        case PROFILE_SCREEN:
          return profilePage(settings);
        case PLAYLIST_SCREEN:
          return playlistPage(settings);
        case ARTISTS_DETAIL_SCREEN:
          return artistsDetailPage(settings);
        case SETTING_SCREEN:
          return settingPage(settings);
        default:
          return comingSoonPage(settings);
      }
    },
    transitionsBuilder: (context, animation, secondaryAnimation, child) =>
        _slideTransition(animation, child),
  );
}

Map<String, WidgetBuilder> routerWithNamed() {
  return {
    "/": (context) => const SplashScreenPage(),
    // "/homeScreen": (context) => const HomePage(),
    // "/profileScreen": (context) => const ProfilePage(),
    // "/comingSoonScreen": (context) => const ComingSoonPage(),
  };
}

Map getArguments(RouteSettings settings) {
  Map arguments = settings.arguments as Map;
  return arguments;
}

SlideTransition _slideTransition(Animation<double> animation, Widget child) {
  const begin = Offset(1, 0);
  const end = Offset.zero;
  const curve = Curves.ease;

  var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

  return SlideTransition(
    position: animation.drive(tween),
    child: child,
  );
}
