import 'package:flutter/material.dart';

class WidgetIcon extends StatelessWidget {
  const WidgetIcon({
    super.key,
    required this.pathIcon,
    this.color,
    this.size,
  });

  final String pathIcon;
  final Color? color;
  final double? size;

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      pathIcon,
      color: color,
      width: size,
      height: size,
    );
  }
}
