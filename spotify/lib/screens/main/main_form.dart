import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spotify/base_class/bloc/base_bloc_form_state_full.dart';
import 'package:spotify/base_class/bloc/base_state.dart';
import 'package:spotify/common/common.dart';
import 'package:spotify/data/models/home/item_navbar.dart';
import 'package:spotify/screens/home/home.dart';
import 'package:spotify/screens/library/library.dart';
import 'package:spotify/screens/main/main_bloc.dart';
import 'package:spotify/screens/main/main_event.dart';
import 'package:spotify/screens/main/main_state.dart';
import 'package:spotify/screens/profile/profile.dart';
import 'package:spotify/screens/search/search_bloc.dart';
import 'package:spotify/screens/search/search_form.dart';
import 'package:spotify/screens/search/search_state.dart';
import 'package:spotify/widgets/svg_png/widget_icon.dart';
import 'package:spotify/widgets/svg_png/widget_svg.dart';

class MainForm extends StatefulWidget {
  const MainForm({super.key});

  @override
  State<MainForm> createState() => _MainFormState();
}

class _MainFormState extends BaseBLocFormStateFull<MainBloc, MainForm> {
  int selectedIndex = 0;

  final List<ItemNavbar> listItemNavbar = [
    ItemNavbar(
        iconActive: MyAssets.icHomeActive,
        iconInActive: MyAssets.icHomeInActive,
        name: "Home"),
    ItemNavbar(
        iconActive: MyAssets.icSearchActive,
        iconInActive: MyAssets.icSearchInActive,
        name: "Search"),
    ItemNavbar(
        iconActive: MyAssets.icLibActive,
        iconInActive: MyAssets.icLibInActive,
        name: "Library"),
  ];

  final List<Widget> listView = [
    BlocProvider(
        create: (context) =>
            HomeBloc(HomeInitial(), context)..add(HomeGetNewRelease()),
        child: const HomeForm()),
    BlocProvider(
        create: (context) => SearchBloc(SearchInitial(), context),
        child: const SearchForm()),
    BlocProvider(
        create: (context) => LibraryBloc(LibraryInitial(), context),
        child: const LibraryForm()),
  ];

  @override
  void listener(BuildContext context, BaseBlocState state) {
    if (state is MainScreenLoadSuccess) {
      setState(() {
        selectedIndex = state.indexPage;
      });
    } else {}
  }

  @override
  Widget getWidget(BuildContext context, BaseBlocState state) {
    return Scaffold(
      bottomNavigationBar: _buildBottomNavigationBar(),
      body: IndexedStack(index: selectedIndex, children: listView),
    );
  }

  Widget _buildBottomNavigationBar() {
    return SafeArea(
      child: Container(
        // padding: const EdgeInsets.symmetric(horizontal: 30),
        // margin: const EdgeInsets.symmetric(horizontal: 15),
        height: 55,
        decoration: const BoxDecoration(),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: List.generate(
              listItemNavbar.length,
              (index) => _buildNavItem(index),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildNavItem(int index) {
    return GestureDetector(
      onTap: () {
        getBloc().add(MainSelectScreen(index: index));
        setState(() {
          selectedIndex = index;
        });
      },
      child: IconNavbar(
        itemNavbar: listItemNavbar[index],
        isActive: index == selectedIndex,
      ),
    );
  }
}

class IconNavbar extends StatelessWidget {
  const IconNavbar({
    super.key,
    required this.itemNavbar,
    required this.isActive,
  });

  final ItemNavbar itemNavbar;
  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          AnimatedContainer(
            duration: const Duration(milliseconds: 500),
            child: Padding(
              padding: const EdgeInsets.only(top: 5),
              child: isActive
                  ? SvgWidget(
                      assetName: itemNavbar.iconActive,
                      size: 30,
                    )
                  : SvgWidget(
                      assetName: itemNavbar.iconInActive,
                      size: 30,
                    ),
            ),
          ),
          const SizedBox(height: 3),
          Text(
            itemNavbar.name,
            style: TextStyle(
              fontSize: 10,
              fontWeight: isActive ? FontWeight.bold : null,
            ),
          )
        ],
      ),
    );
  }
}
