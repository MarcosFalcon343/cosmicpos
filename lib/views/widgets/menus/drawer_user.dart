import 'package:flutter/material.dart';

class DrawerUser  extends StatelessWidget {
  const DrawerUser ({Key? key, required this.user, required this.rol, required this.email}) : super(key: key);
  final String user;
  final String rol;
  final String email;
  @override
  Widget build(BuildContext context) {
    return  UserAccountsDrawerHeader(
              accountName: Text('$user ($rol)'),
              accountEmail: Text(email),
              currentAccountPicture: const CircleAvatar(
                child: Icon(Icons.person),
              ),
              decoration: BoxDecoration(
                color: (Theme.of(context).brightness == Brightness.dark)? Colors.grey[10]: null,
              ),
            );
  }
}