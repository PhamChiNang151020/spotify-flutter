import 'package:flutter/material.dart';
import 'package:spotify/common/my_colors.dart';
import 'package:spotify/widgets/widgets.dart';

class WidgetLogin extends StatefulWidget {
  const WidgetLogin({super.key, required this.onPressed});

  final Function(String clientId, String clientSecret) onPressed;

  @override
  State<WidgetLogin> createState() => _WidgetLoginState();
}

class _WidgetLoginState extends State<WidgetLogin> {
  final _clientId = TextEditingController();
  final _clientSecret = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: MyColors.black,
      shape: OutlineInputBorder(
        borderSide: const BorderSide(
          color: Colors.white,
        ),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                "LOGIN",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 15),
              _formField(
                title: "Client ID",
                controller: _clientId,
                error: "Please enter Client ID",
              ),
              _formField(
                title: "Client Secret",
                controller: _clientSecret,
                error: "Please enter Client Secret",
              ),
              const SizedBox(height: 15),
              WidgetButtonFill(
                text: "Login",
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    widget.onPressed(_clientId.text, _clientSecret.text);
                  }
                },
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _formField({
    required String title,
    required TextEditingController controller,
    required String error,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title),
          const SizedBox(height: 5),
          TextFormField(
            controller: controller,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return error;
              }
              return null;
            },
          )
        ],
      ),
    );
  }
}
