import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:spotify/common/my_theme.dart';

import 'base_class/api/my_http_overrides.dart';
import 'base_class/router.dart';

Future<void> main() async {
  HttpOverrides.global = MyHttpOverrides();
  WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);

  runApp(
    MaterialApp(
      title: 'SPOTIFY',
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      theme: MyTheme.myTheme(),
      onGenerateRoute: (settings) {
        return routerWithData(settings);
      },
      routes: routerWithNamed(),
    ),
  );
}
