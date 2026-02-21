import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:template_flutter_test/router/guards/repository/index.dart';

class PermissionGuard implements RouteGuard {

  @override
  String? check(BuildContext context, GoRouterState state, Ref ref) {
    
    // TODO: Acceder al provider de autenticación para obtener los permisos del usuario
    // TODO: Comparar los permisos del usuario con los permisos requeridos para acceder a la ruta

    return null;
  }
  
}