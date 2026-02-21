
import 'package:go_router/src/state.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:template_flutter_test/router/guards/repository/index.dart';

class RoleGuard implements RouteGuard {

  @override
  String? check(BuildContext context, GoRouterState state, Ref ref) {

    // TODO: Acceder al provider de autenticación para obtener los roles del usuario
    // TODO: Comparar los roles del usuario con los roles requeridos para acceder a la ruta

    return null;
  }
  
}