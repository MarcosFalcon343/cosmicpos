import 'package:cosmicpos/helpers/image_helpers.dart';
import 'package:flutter/material.dart';

class DrawerOption extends StatelessWidget {
  final String url;
  final String text;

  const DrawerOption({Key? key, required this.url, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: ImageHelpers().svgImage(url: url, width: 30, height: 30),
      title: Text(text), textColor: Colors.white,
    );
  }
}