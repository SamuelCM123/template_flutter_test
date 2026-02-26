
import 'package:flutter/material.dart';

class MenuItem {
  final String title;
  final String name;
  final String path;
  final IconData icon;
  final List<MenuItem>? children;
  // final Widget Function(BuildContext, GoRouterState, Widget) builder;

  MenuItem(
    {
      this.children,
      required this.title,
      required this.name,
      required this.path,
      required this.icon,
      // required this.builder
    });

  // TODO: ENFOCADO PARA EL SIDEBAR O EL MENU DEL MOVIL
  static final List<MenuItem> appMenu = <MenuItem>[
    // MenuItem(
    //   title: 'Index Layout',
    //   name: 'tickets',
    //   path: '/tickets',
    //   icon: Icons.receipt_long,
    //   children: [
        
    //     MenuItem(
    //       title: 'Desk',
    //       name: 'desk',
    //       path: '/tickets/desk',
    //       icon: Icons.receipt_long
    //     ),

    //     MenuItem(
    //       title: 'Index',
    //       name: 'index-component',
    //       path: '/tickets/index-component',
    //       icon: Icons.receipt_long
    //     ),

    //   ]
    // ),
    MenuItem(
      title: 'Public', 
      name: 'public',
      path: '/public',
      icon: Icons.public
    ),
    MenuItem(
      title: 'New Ticket', 
      name: 'new-ticket',
      path: '/new-ticket',
      icon: Icons.add_circle_outline
    ),
    MenuItem(
      title: 'Index Component', 
      name: 'index-component',
      path: '/index-component',
      icon: Icons.receipt_long,
    ),
    MenuItem(
      title: 'Update App',
      name: 'update-app', 
      path: '/update-app', 
      icon: Icons.update
    )
  ];

  static final mainRoutes = <MenuItem>[
    MenuItem(
      title: 'Home',
      name: 'home',
      path: '/',
      icon: Icons.home,
      children: appMenu
    ),
    /**
     *? AQUI VAN TODAS LAS RUTAS PRINCIPALES SIN NECESIDAD DE AUTENTICACIÓN COMO:
     * 1- Login(Home)
     * 2- Register
     * 3- Forgot Password
     * 4- etc...
     */
  ];

}