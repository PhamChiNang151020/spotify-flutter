import 'package:spotify/base_class/bloc/base_bloc_page.dart';
import 'package:spotify/utils/screen_key.dart';
import 'package:spotify/utils/utils.dart';
import 'package:spotify/base_class/router.dart';
import 'package:flutter/material.dart';
import 'search.dart';

class SearchPage extends BaseBlocPage<SearchBloc> {
  const SearchPage({super.key});

  @override
  Widget getForm() {
    return const SearchForm();
  }

  @override
  SearchBloc myBloc(BuildContext context) {
    return SearchBloc(initialState, context);
  }
}

gotoSearchPage({required BuildContext context}) {
  var data = {};
  Utils().changeScreenNamedWithData(context, SEARCH_SCREEN, data);
}

SearchPage searchPage(RouteSettings settings) {
  var arguments = getArguments(settings);
  //var type = arguments["field name"];
  return const SearchPage();
}
