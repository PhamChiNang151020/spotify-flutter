import 'package:spotify/base_class/bloc/base_bloc_page.dart';
import 'package:spotify/utils/screen_key.dart';
import 'package:spotify/utils/utils.dart';
import 'package:spotify/base_class/router.dart';
import 'package:flutter/material.dart';
import 'library.dart';

class LibraryPage extends BaseBlocPage<LibraryBloc> {
  const LibraryPage({super.key});

  @override
  Widget getForm() {
    return const LibraryForm();
  }

  @override
  LibraryBloc myBloc(BuildContext context) {
    return LibraryBloc(initialState, context);
  }
}

gotoLibraryPage({required BuildContext context}) {
  var data = {};
  Utils().changeScreenNamedWithData(context, LIBRARY_SCREEN, data);
}

LibraryPage libraryPage(RouteSettings settings) {
  var arguments = getArguments(settings);
  //var type = arguments["field name"];
  return const LibraryPage();
}
