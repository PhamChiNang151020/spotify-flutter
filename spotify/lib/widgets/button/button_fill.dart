import 'package:flutter/material.dart';
import 'package:spotify/common/my_colors.dart';

class WidgetButtonFill extends StatefulWidget {
  const WidgetButtonFill({
    super.key,
    required this.text,
    required this.onPressed,
    this.buttonStyle,
    this.textStyle,
  });

  final String text;
  final Function() onPressed;
  final ButtonStyle? buttonStyle;
  final TextStyle? textStyle;

  @override
  State<WidgetButtonFill> createState() => _WidgetButtonFillState();
}

class _WidgetButtonFillState extends State<WidgetButtonFill> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: widget.onPressed,
        style: widget.buttonStyle ??
            ButtonStyle(
              backgroundColor: WidgetStateProperty.all(Colors.green),
            ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 15.0),
          child: Text(
            widget.text,
            style: widget.textStyle ??
                const TextStyle(
                  color: MyColors.black,
                  fontWeight: FontWeight.bold,
                ),
          ),
        ),
      ),
    );
  }
}
