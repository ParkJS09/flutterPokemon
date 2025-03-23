import 'package:flutter/material.dart';

extension AssetImageExtension on String {
  Image asAssetImage({
    double? width,
    double? height,
    BoxFit? fit,
    Color? color,
  }) {
    return Image.asset(
      'presentation/assets/images/$this',
      width: width,
      height: height,
      fit: fit,
      color: color,
    );
  }
}
