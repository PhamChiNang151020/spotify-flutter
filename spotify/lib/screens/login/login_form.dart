import 'package:spotify/base_class/bloc/base_bloc_form_state_full.dart';
import 'package:spotify/base_class/bloc/base_state.dart';

import 'package:flutter/material.dart';
import 'package:spotify/common/my_assets.dart';
import 'package:spotify/screens/login/widget_login.dart';
import 'package:spotify/screens/main/main_page.dart';
import 'package:spotify/screens/sign_up/sign_up_page.dart';
import 'package:spotify/utils/utils.dart';

import 'package:spotify/widgets/button/button_fill.dart';
import 'package:spotify/widgets/button/button_outline.dart';
import 'package:spotify/widgets/svg_png/widget_svg.dart';
import 'login.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends BaseBLocFormStateFull<LoginBloc, LoginForm> {
  List<Map<String, dynamic>> listButton = [
    {
      "icon": MyAssets.icGoogle,
      "text": "Continue with Google",
    },
    {
      "icon": MyAssets.icFaceBook,
      "text": "Continue with Facebook",
    },
    {
      "icon": MyAssets.icApple,
      "text": "Continue with Apple",
    }
  ];
  @override
  Widget getWidget(BuildContext context, BaseBlocState state) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: Column(
        children: [
          const Expanded(flex: 4, child: SizedBox()),
          Expanded(
            flex: 6,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SvgWidget(
                  assetName: MyAssets.logo,
                  size: 50,
                ),
                Text("Millions of Songs.", style: _styleTitle()),
                Text("Free on Spotify", style: _styleTitle()),
                const SizedBox(height: 20),
                WidgetButtonFill(
                    text: "Sign up free",
                    onPressed: () {
                      gotoSignUpPage(context: context);
                    }),
                const SizedBox(height: 5),
                Column(
                  children: List.generate(
                    listButton.length,
                    (index) {
                      return WidgetButtonOutline(
                        text: listButton[index]["text"],
                        icon: listButton[index]["icon"],
                        onPressed: () {},
                      );
                    },
                  ),
                ),
                const SizedBox(height: 5),
                TextButton(
                    onPressed: () {
                      _showDialogLogin(context);
                    },
                    child: const Text(
                      "Log in",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                      ),
                    ))
              ],
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _showDialogLogin(BuildContext context) {
    return showDialog(
      context: context,
      builder: (context) => WidgetLogin(
        onPressed: (clientID, clientSecret) {
          getBloc().add(LoginEvent(
            clientID: clientID,
            clientSecret: clientSecret,
          ));

          // Navigator.of(context).pop();
        },
      ),
    );
  }

  @override
  void listener(BuildContext context, BaseBlocState state) {
    if (state is LoginSuccess) {
      gotoMainPage(context: context);
    }

    if (state is LoginFailure) {
      logger.i("Login Failure");
    }
  }

  TextStyle _styleTitle() {
    return const TextStyle(fontSize: 25, fontWeight: FontWeight.bold);
  }
}
