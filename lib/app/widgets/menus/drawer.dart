import 'package:cosmicpos/app/modules/Categorias_module/categorias_screen.dart';
import 'package:cosmicpos/app/modules/Categorias_module/controller_categoria.dart';
import 'package:cosmicpos/app/modules/Clientes_module/clientes_screen.dart';
import 'package:cosmicpos/app/modules/Inventario_module/inventario_screen.dart';
import 'package:cosmicpos/app/modules/POS_module/pos_screen.dart';
import 'package:cosmicpos/app/modules/Productos_module/productos_screen.dart';
import 'package:cosmicpos/app/modules/Proveedores_module/provedores_screen.dart';
import 'package:cosmicpos/app/modules/Proveedores_module/proveedor_controller.dart';
import 'package:cosmicpos/app/modules/Usuarios_module/usuarios_screen.dart';
import 'package:cosmicpos/app/widgets/menus/drawer_option.dart';
import 'package:cosmicpos/app/widgets/menus/drawer_user.dart';
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
        children: <Widget>[
          const DrawerUser(
            user: 'Marcos',
            rol: 'Administrador',
            email: 'marcosfalcon2003@gmail.com',
          ),
          DrawerOption(
            url: 'assets/cart-outline.svg',
            text: 'Venta',
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (c) {
                return const PosScreen();
              }));
            },
          ),
          DrawerOption(
            url: 'assets/grid-fill.svg',
            text: 'Productos',
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (c) {
                return const ProductosScreen();
              }));
            },
          ),
          DrawerOption(
            url: 'assets/product.svg',
            text: 'Inventario',
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (c) {
                return const InvetarioScreen();
              }));
            },
          ),
          // DrawerOption(
          //   url: 'assets/chart-bar.svg',
          //   text: 'Reportes',
          //   onTap: () {
          //     Navigator.push(context, MaterialPageRoute(builder: (c) {
          //       return const ProveedoresScreen();
          //     }));
          //   },
          // ),
          DrawerOption(
            url: 'assets/account.svg',
            text: 'Clientes',
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (c) {
                return const ClientesScreen();
              }));
            },
          ),
          DrawerOption(
            url: 'assets/account-multiple.svg',
            text: 'Usuarios',
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (c) {
                return const UsuariosScreen();
              }));
            },
          ),
          DrawerOption(
            url: 'assets/truck-delivery.svg',
            text: 'Proveedores',
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (c) {
                return ProveedoresScreen(controller: ProveedorController());
              }));
            },
          ),
          DrawerOption(
            url: 'assets/category.svg',
            text: 'Categorias',
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (c) {
                return CategoriasScreen(controller: CategoriaController());
              }));
            },
          ),
          const SizedBox(
            height: 20,
          ),
          DrawerOption(
            url: 'assets/leave.svg',
            text: 'Cerrar sesion',
            onTap: () {},
          ),
        ],
      ),
    ));
  }
}
