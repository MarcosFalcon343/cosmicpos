import 'package:cosmicpos/app/widgets/menus/drawer.dart';
import 'package:flutter/material.dart';

class ProveedoresScreen extends StatelessWidget {
  const ProveedoresScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: drawer(),
    );
  }
}
