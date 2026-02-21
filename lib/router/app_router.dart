import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:template_flutter_test/modules/home_screen.dart';
import 'package:template_flutter_test/router/guards/permission_guard.dart';
import 'package:template_flutter_test/router/guards/repository/index.dart';
import 'package:template_flutter_test/router/guards/role_guard.dart';
import 'package:template_flutter_test/router/guards/socket_guard.dart';

// class AppRouter {

final routerProvider = Provider<GoRouter>((ref) {
  // TODO: Implementar el provider de autenticación (Permisos hardocodeados por ahora)
  // TODO: Implementar el provider del socket

  return GoRouter(
    initialLocation: '/',
    redirect: (context, state) {

      final path = state.matchedLocation;

      if(path == '/'){
        return _executeGuards(context, state, ref, [
          SocketGuard(),
          PermissionGuard(),
          RoleGuard()
        ] );
      }

      return null;
    },
    routes: [
      GoRoute(
        path: '/', 
        builder: (context, state) => HomeScreen())
    ],
  );
});

// }

// TODO: Integrar una funcion para ejecutar Guards
String? _executeGuards(BuildContext context, GoRouterState state, Ref ref, List<RouteGuard> guards) {
  for (final guard in guards){
    final redirectPath = guard.check(context, state, ref);
    if(redirectPath != null) return redirectPath;
  }
  return null;
}