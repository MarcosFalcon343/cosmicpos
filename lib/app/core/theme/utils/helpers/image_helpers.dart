import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ImageHelpers {
  
Widget svgImage({
  required String url,
  required int width,
  required int height,
  Color? color,
}) {
  color ??= Colors.white;

  return SvgPicture.asset(
    url,
    width: width.toDouble(),
    height: height.toDouble(),
    colorFilter: ColorFilter.mode(color, BlendMode.srcIn),
  );
}


}