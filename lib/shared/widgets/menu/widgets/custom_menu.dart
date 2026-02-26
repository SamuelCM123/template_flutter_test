// TODO: Obtener la lista de opciones para el menu desde la carpeta del router

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:template_flutter_test/router/routes/index.dart';
import 'package:template_flutter_test/shared/widgets/menu/providers/custom_menu_provider.dart';

class CustomMenu extends ConsumerStatefulWidget {
  final GlobalKey<ScaffoldState> scaffoldKey;

  const CustomMenu({super.key, required this.scaffoldKey});

  @override
  ConsumerState<CustomMenu> createState() => _CustomMenuState();
}

class _CustomMenuState extends ConsumerState<CustomMenu> {
  @override
  Widget build(BuildContext context) {
    
    final location = GoRouterState.of(context).topRoute?.name;
    final selectIndexMenu = ref.watch(selectedMenuIndex(location!));

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
            selected: selectIndexMenu == index,
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
