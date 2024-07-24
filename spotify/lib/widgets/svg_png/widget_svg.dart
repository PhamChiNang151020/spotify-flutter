import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SvgWidget extends StatelessWidget {
  const SvgWidget({
    super.key,
    required this.assetName,
    this.width,
    this.height,
    this.fit,
  });

  final String assetName;
  final double? width;
  final double? height;
  final BoxFit? fit;

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      assetName,
      fit: fit ?? BoxFit.contain,
      width: width ?? 100,
      height: height ?? 100,
    );
  }
}
