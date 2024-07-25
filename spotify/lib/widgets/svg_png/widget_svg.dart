import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SvgWidget extends StatelessWidget {
  const SvgWidget({
    super.key,
    required this.assetName,
    this.size,
    this.fit,
  });

  final String assetName;
  final double? size;

  final BoxFit? fit;

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      assetName,
      fit: fit ?? BoxFit.contain,
      width: size ?? 30,
      height: size ?? 30,
    );
  }
}
