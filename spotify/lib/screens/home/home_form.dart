import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:spotify/base_class/bloc/base_bloc_form_state_full.dart';
import 'package:spotify/base_class/bloc/base_state.dart';

import 'package:flutter/material.dart';
import 'package:spotify/common/my_assets.dart';
import 'package:spotify/utils/utils.dart';
import 'package:spotify/widgets/svg_png/widget_icon.dart';
import 'package:spotify/widgets/svg_png/widget_svg.dart';
import 'home.dart';

class HomeForm extends StatefulWidget {
  const HomeForm({super.key});

  @override
  State<HomeForm> createState() => _HomeFormState();
}

class _HomeFormState extends BaseBLocFormStateFull<HomeBloc, HomeForm> {
  @override
  Widget getWidget(BuildContext context, BaseBlocState state) {
    EdgeInsets devicePadding = MediaQuery.of(context).padding;
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.only(
            top: getPaddingSafeArea(context).top,
            right: 15,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              GestureDetector(
                onTap: () {},
                child: const SvgWidget(assetName: MyAssets.icSetting),
              )
            ],
          ),
        ),
        // Text("HOME SCREEN"),
      ],
    );
  }

  @override
  void listener(BuildContext context, BaseBlocState state) {}
}
