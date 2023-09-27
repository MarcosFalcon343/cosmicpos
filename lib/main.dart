import 'package:cosmicpos/config/theme/app_theme.dart';
import 'package:cosmicpos/views/POS/pos_screen.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

Future<void> main() async {
  await Hive.initFlutter();
  //await Hive.openBox('productos');
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CosmicPOS',
      debugShowCheckedModeBanner: false,
      theme: AppTheme(darkMode: false).theme(),
      home: const PosScreen()
    );
  }
}
