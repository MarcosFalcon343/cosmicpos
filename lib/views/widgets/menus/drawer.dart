import 'package:cosmicpos/views/widgets/menus/drawer_option.dart';
import 'package:cosmicpos/views/widgets/menus/drawer_user.dart';
import 'package:flutter/material.dart';

class drawer extends StatelessWidget {
  const drawer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {

    final color = Theme.of(context).colorScheme;
    final brightness = Theme.of(context).brightness;

    //color: (brightness == Brightness.light) ? color.primary : null,
    return Drawer(
      child: Container(
        color: (brightness == Brightness.light) ? color.primary : null,
        child: ListView(
          padding: EdgeInsets.zero,
          children: const <Widget>[
            DrawerUser(user: 'Marcos', rol: 'Administrador',email: 'marcosfalcon2003@gmail.com',),
            DrawerOption(url: 'assets/cart-outline.svg', text: 'Venta',),
            DrawerOption(url: 'assets/grid-fill.svg', text: 'Productos',),
            DrawerOption(url: 'assets/product.svg', text: 'Inventario',),
            DrawerOption(url: 'assets/chart-bar.svg', text: 'Reportes',),
            DrawerOption(url: 'assets/account.svg', text: 'Clientes',),
            DrawerOption(url: 'assets/account-multiple.svg', text: 'Usuarios',),
            DrawerOption(url: 'assets/truck-delivery.svg', text: 'Proveedores',),
            DrawerOption(url: 'assets/category.svg', text: 'Categorias',),
            SizedBox(height: 20,),
            DrawerOption(url: 'assets/leave.svg', text: 'Cerrar sesion',),
          ],
        ),
      )
    );
  }
}