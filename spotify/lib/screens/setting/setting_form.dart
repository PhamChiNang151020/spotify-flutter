import 'package:spotify/base_class/bloc/base_bloc_form_full_app_bar.dart';
import 'package:spotify/base_class/bloc/base_bloc_form_state_full.dart';
import 'package:spotify/base_class/bloc/base_state.dart';

import 'package:flutter/material.dart';
import 'package:spotify/base_class/storage/app_shared_preferences.dart';
import 'package:spotify/common/my_assets.dart';
import 'package:spotify/data/models/setting_models.dart';
import 'package:spotify/screens/coming_soon/coming_soon_page.dart';
import 'package:spotify/screens/login/login.dart';
import 'package:spotify/widgets/svg_png/widget_icon.dart';
import 'package:spotify/widgets/widgets.dart';
import 'setting.dart';

class SettingForm extends StatefulWidget {
  const SettingForm({super.key});

  @override
  State<SettingForm> createState() => _SettingFormState();
}

class _SettingFormState
    extends BaseBLocFormStateFullAppBar<SettingBloc, SettingForm> {
  List<SettingModel> listSetting = [];
  @override
  Widget getWidget(BuildContext context, BaseBlocState state) {
    return ListView(
      children: [
        _profile(context),
        const SizedBox(height: 15),
        ListView.builder(
          shrinkWrap: true,
          itemCount: listSetting.length,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            final itemSetting = listSetting[index];
            return InkWell(
              onTap: () {
                gotoComingSoonPage(context: context);
              },
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
                child: Row(
                  children: [
                    Expanded(
                      flex: 8,
                      child: Text(
                        itemSetting.name,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const Icon(Icons.arrow_forward_ios_sharp)
                  ],
                ),
              ),
            );
          },
        ),
        const SizedBox(height: 15),
        _logout()
      ],
    );
  }

  Row _logout() {
    return Row(
      children: [
        const Expanded(flex: 3, child: SizedBox()),
        Expanded(
          flex: 3,
          child: WidgetButtonFill(
            text: "Logout",
            onPressed: () async {
              await AppSharedPreferences().resetSharedPreferences();
              gotoLoginPage(context: context);
            },
          ),
        ),
        const Expanded(flex: 3, child: SizedBox()),
      ],
    );
  }

  InkWell _profile(BuildContext context) {
    return InkWell(
      onTap: () {
        gotoComingSoonPage(context: context);
      },
      child: const Padding(
        padding: EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                CircleAvatar(
                  backgroundColor: Color.fromARGB(153, 188, 188, 188),
                  maxRadius: 30,
                  minRadius: 30,
                  child: WidgetIcon(
                    pathIcon: MyAssets.imgAvatar,
                  ),
                ),
                SizedBox(width: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Pham Chi Nang",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text("View Profile"),
                  ],
                ),
              ],
            ),
            Icon(Icons.arrow_forward_ios_sharp)
          ],
        ),
      ),
    );
  }

  @override
  void listener(BuildContext context, BaseBlocState state) {
    if (state is SettingLoadSuccess) {
      setState(() {
        listSetting = state.listSetting;
      });
    }
  }

  @override
  Widget getTitle() {
    // TODO: implement getTitle
    return const Text("Setting");
  }
}
