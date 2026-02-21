// TODO: Obtener la lista de opciones para el menu desde la carpeta del router

import 'package:flutter/material.dart';
import 'package:template_flutter_test/router/routes/index.dart';

class CustomMenu extends StatefulWidget {
  
  const CustomMenu({super.key});

  @override
  State<CustomMenu> createState() => _CustomMenuState();
}

class _CustomMenuState extends State<CustomMenu> {
  @override
  Widget build(BuildContext context) {
    return NavigationDrawer(
      onDestinationSelected: (value) => Navigator.pushNamed(context, MenuItem.appMenu[value].path),
      children: [
        ...MenuItem.appMenu
        .sublist(0,3)
            .map((item) => NavigationDrawerDestination(
                  icon: Icon(item.icon),
                  label: Text(item.title),
                  selectedIcon: Icon(item.icon),
            )),
          ],
        
      );
  }
}