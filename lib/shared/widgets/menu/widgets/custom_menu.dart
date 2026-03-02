// TODO: Obtener la lista de opciones para el menu desde la carpeta del router

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:template_flutter_test/router/routes/index.dart';

class CustomMenu extends StatefulWidget {
  final GlobalKey<ScaffoldState> scaffoldKey;
  final int selectIndexMenu;

  CustomMenu({
    super.key,
    required this.scaffoldKey,
    required this.selectIndexMenu,
  });

  @override
  State<CustomMenu> createState() => _CustomMenuState();
}

class _CustomMenuState extends State<CustomMenu> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView.builder(
        itemCount: MenuItem.appMenu.length,
        itemBuilder: (context, index) {
          final item = MenuItem.appMenu[index];
          return ListTile(
            selectedColor: Color(0XFF293277),
            selectedTileColor: Color(0xFFE7E9FB),
            leading: Icon(item.icon),
            title: Text(item.title),
            selected: widget.selectIndexMenu == index,
            onTap: () {
              context.goNamed(item.name);
              widget.scaffoldKey.currentState?.closeDrawer();
            },
          );
        },
      ),
    );
  }
}
