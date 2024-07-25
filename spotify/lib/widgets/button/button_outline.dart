import 'package:flutter/material.dart';
import 'package:spotify/widgets/svg_png/widget_svg.dart';

class WidgetButtonOutline extends StatefulWidget {
  const WidgetButtonOutline({
    super.key,
    required this.text,
    required this.icon,
    this.onPressed,
    this.buttonStyle,
    this.textStyle,
  });

  final String text;
  final Function()? onPressed;
  final ButtonStyle? buttonStyle;
  final TextStyle? textStyle;
  final String icon;

  @override
  State<WidgetButtonOutline> createState() => _WidgetButtonOutlineState();
}

class _WidgetButtonOutlineState extends State<WidgetButtonOutline> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: OutlinedButton(
        onPressed: () {},
        style: ButtonStyle(
          side: WidgetStateProperty.all(
            const BorderSide(width: 1, color: Colors.white),
          ),
          padding:
              const WidgetStatePropertyAll(EdgeInsets.symmetric(vertical: 15)),
        ),
        child: Row(
          children: [
            Expanded(
              flex: 1,
              child: SvgWidget(
                assetName: widget.icon,
                size: 20,
              ),
            ),
            Expanded(
              flex: 6,
              child: Center(
                  child: Text(
                widget.text,
                style: widget.textStyle ??
                    const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
              )),
            ),
            const Expanded(
              flex: 1,
              child: SizedBox(),
            )
          ],
        ),
      ),
    );
  }
}
