import 'package:cosmicpos/app/core/theme/app_theme.dart';
import 'package:cosmicpos/app/data/models/Actores/cliente.dart';
import 'package:cosmicpos/app/data/models/Actores/provedor.dart';
import 'package:cosmicpos/app/data/models/Productos/categoria.dart';
import 'package:cosmicpos/app/modules/POS_module/pos_screen.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

Future<void> main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(CategoriaAdapter());
  Hive.registerAdapter(ProveedorAdapter());
  Hive.registerAdapter(ClienteAdapter());
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
        home: const PosScreen());
  }
}
