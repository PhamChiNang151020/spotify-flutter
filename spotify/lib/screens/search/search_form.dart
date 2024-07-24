import 'package:spotify/base_class/bloc/base_bloc_form_state_full.dart';
import 'package:spotify/base_class/bloc/base_state.dart';

import 'package:flutter/material.dart';
import 'search.dart';

class SearchForm extends StatefulWidget {
  const SearchForm({super.key});

  @override
  State<SearchForm> createState() => _SearchFormState();
}

class _SearchFormState extends BaseBLocFormStateFull<SearchBloc, SearchForm> {
  @override
  Widget getWidget(BuildContext context, BaseBlocState state) {
    return const Text("Search");
  }

  @override
  void listener(BuildContext context, BaseBlocState state) {
    // TODO: implement listener
  }
}
