import 'package:cosmicpos/config/theme/app_theme.dart';
import 'package:cosmicpos/helpers/image_helpers.dart';
import 'package:cosmicpos/views/widgets/menus/drawer.dart';
import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CosmicPOS',
      debugShowCheckedModeBanner: false,
      theme: AppTheme(darkMode: false).theme(),
      home: Scaffold(
        drawer: const drawer(),
        appBar: AppBar(
          title: const Text('Material App Bar'),
        ),
        body: SafeArea(
          child: ImageHelpers().svgImage(url: 'assets/account.svg', width: 256, height: 256),
        ),
      ),
    );
  }
}
