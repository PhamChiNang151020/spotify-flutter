import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spotify/base_class/bloc/base_bloc_form_state_full.dart';
import 'package:spotify/base_class/bloc/base_state.dart';
import 'package:spotify/common/common.dart';
import 'package:spotify/data/models/home/item_navbar.dart';
import 'package:spotify/screens/home/home.dart';
import 'package:spotify/screens/main/main_bloc.dart';
import 'package:spotify/screens/main/main_event.dart';
import 'package:spotify/screens/main/main_state.dart';
import 'package:spotify/screens/notification/notification.dart';
import 'package:spotify/screens/profile/profile.dart';
import 'package:spotify/screens/search/search_bloc.dart';
import 'package:spotify/screens/search/search_form.dart';
import 'package:spotify/screens/search/search_state.dart';
import 'package:spotify/widgets/svg_png/widget_icon.dart';

class MainForm extends StatefulWidget {
  const MainForm({super.key});

  @override
  State<MainForm> createState() => _MainFormState();
}

class _MainFormState extends BaseBLocFormStateFull<MainBloc, MainForm> {
  int selectedIndex = 0;

  final List<ItemNavbar> listItemNavbar = [
    ItemNavbar(icon: MyAssets.icHome, name: "Home"),
    ItemNavbar(icon: MyAssets.icSearch, name: "Search"),
    ItemNavbar(icon: MyAssets.icNotification, name: "Notification"),
    ItemNavbar(icon: MyAssets.icPerson, name: "Profile"),
  ];

  final List<Widget> listView = [
    BlocProvider(
        create: (context) => HomeBloc(HomeLoadSuccess(), context),
        child: const HomeForm()),
    BlocProvider(
        create: (context) => SearchBloc(SearchLoadSuccess(), context),
        child: const SearchForm()),
    BlocProvider(
        create: (context) =>
            NotificationBloc(NotificationLoadSuccess(), context),
        child: const NotificationForm()),
    BlocProvider(
        create: (context) => ProfileBloc(ProfileLoadSuccess(), context),
        child: const ProfileForm()),
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
        padding: const EdgeInsets.symmetric(horizontal: 30),
        margin: const EdgeInsets.symmetric(horizontal: 15),
        height: 55,
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 0, 0, 0),
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 5,
              blurRadius: 5,
              offset: const Offset(0, 3),
            )
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: List.generate(
            listItemNavbar.length,
            (index) => _buildNavItem(index),
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
        icon: listItemNavbar[index].icon,
        isActive: index == selectedIndex,
      ),
    );
  }
}

class IconNavbar extends StatelessWidget {
  const IconNavbar({
    super.key,
    required this.icon,
    required this.isActive,
  });

  final String icon;
  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          height: 5,
          width: isActive ? 25 : 0,
          decoration: BoxDecoration(
            color: isActive ? MyColors.defaultColor : Colors.transparent,
            borderRadius: BorderRadius.circular(5),
          ),
        ),
        AnimatedContainer(
          duration: const Duration(milliseconds: 500),
          child: Padding(
            padding: const EdgeInsets.only(top: 5),
            child: WidgetIcon(
              pathIcon: icon,
              size: 30,
              color: isActive ? MyColors.defaultColor : Colors.white,
            ),
          ),
        ),
      ],
    );
  }
}
