import 'package:spotify/base_class/bloc/base_bloc_form_full_app_bar.dart';
import 'package:spotify/base_class/bloc/base_bloc_form_state_full.dart';
import 'package:spotify/base_class/bloc/base_state.dart';

import 'package:flutter/material.dart';
import 'package:spotify/common/common.dart';
import 'package:spotify/screens/login/login.dart';
import 'package:spotify/widgets/widgets.dart';
import 'sign_up.dart';

class SignUpForm extends StatefulWidget {
  const SignUpForm({super.key});

  @override
  State<SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState
    extends BaseBLocFormStateFullAppBar<SignUpBloc, SignUpForm> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _nameController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool check1 = false;
  bool check2 = false;
  @override
  Widget getWidget(BuildContext context, BaseBlocState state) {
    return Form(
      key: _formKey,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _formField(
              controller: _emailController,
              title: "What's your email?",
              hint: "You'll need to confirm this email later",
            ),
            _formField(
              controller: _passwordController,
              title: "Create a password",
              hint: "Use at least 8 characters.",
              isPassword: true,
            ),
            _formField(
              controller: _nameController,
              title: "What's your name?",
              hint: "This appears on your spotify profile.",
            ),
            const SizedBox(height: 15),
            _termsOfUse(),
            const SizedBox(height: 15),
            _privacyPolicy(),
            const SizedBox(height: 15),
            Row(
              children: [
                const Expanded(flex: 2, child: SizedBox()),
                Expanded(
                  flex: 6,
                  child: WidgetButtonFill(
                    text: "Create an account",
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        gotoLoginPage(context: context);
                      }
                    },
                    buttonStyle: ButtonStyle(
                      backgroundColor: WidgetStateProperty.all(Colors.white),
                    ),
                  ),
                ),
                const Expanded(flex: 2, child: SizedBox()),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _formField(
      {required TextEditingController controller,
      required String title,
      required String hint,
      bool? isPassword}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 7),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 5),
          TextFormField(
            controller: controller,
            obscureText: isPassword ?? false,
          ),
          Text(
            hint,
            style: const TextStyle(
              fontSize: 10,
            ),
          ),
        ],
      ),
    );
  }

  Widget _termsOfUse() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Terms of Use",
          style: _stylesCustom(),
        ),
        const SizedBox(height: 5),
        const Text(
          "To learn more about how Spotify collects, uses, shares and protects your personal data, please see the Spotify Privacy Policy.",
        ),
      ],
    );
  }

  Widget _privacyPolicy() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Privacy Policy",
          style: _stylesCustom(),
        ),
        const SizedBox(height: 5),
        Row(
          children: [
            const Expanded(
              flex: 9,
              child: Text("Please send me news and offer from Spotify."),
            ),
            Expanded(
              flex: 1,
              child: Checkbox(
                value: check1,
                checkColor: MyColors.defaultColor,
                activeColor: Colors.transparent,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                onChanged: (value) {
                  setState(() {
                    check1 = value ?? false;
                  });
                },
              ),
            )
          ],
        ),
        const SizedBox(height: 5),
        Row(
          children: [
            const Expanded(
              flex: 9,
              child: Text(
                  "Share my registration data with Spotify's content provider for marketing purposes."),
            ),
            Expanded(
              flex: 1,
              child: Checkbox(
                value: check2,
                checkColor: MyColors.defaultColor,
                activeColor: Colors.transparent,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                onChanged: (value) {
                  setState(() {
                    check2 = value ?? false;
                  });
                },
              ),
            )
          ],
        )
      ],
    );
  }

  TextStyle _stylesCustom() {
    return const TextStyle(
      color: MyColors.defaultColor,
      fontWeight: FontWeight.bold,
    );
  }

  @override
  void listener(BuildContext context, BaseBlocState state) {
    // TODO: implement listener
  }

  @override
  Widget getTitle() {
    return const Text("Create account");
  }
}
