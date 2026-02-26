import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:template_flutter_test/modules/downloads/screens/update_app_screen.dart';
import 'package:template_flutter_test/modules/home_screen.dart';
import 'package:template_flutter_test/router/guards/index.dart';
import 'package:template_flutter_test/modules/tickets/screens/index.dart';
import 'package:template_flutter_test/router/guards/repository/index.dart';

// class AppRouter {

final routerProvider = Provider<GoRouter>((ref) {
  // TODO: Implementar el provider de autenticación (Permisos hardocodeados por ahora)
  // TODO: Implementar el provider del socket

  return GoRouter(
    initialLocation: '/dashboard/new-ticket',
    debugLogDiagnostics: true,
    redirect: (context, state) {
      // TODO: Validar redireccionamientos dependiendo la autenticación del usuario, permisos, roles, etc...
      // final path = state.matchedLocation;

      // if(path == '/'){
      //   return _executeGuards(context, state, ref, [
      //     SocketGuard(),
      //     PermissionGuard(),
      //     RoleGuard()
      //   ] );
      // }

      return null;
    },
    routes: [
      //? RUTAS PUBLICAS (Login, Register, Forgot Password, etc...)

      //? RUTAS PADRE (Dashboard, etc...)
      StatefulShellRoute.indexedStack(
        builder: (context, state, navigationShell) {
          return HomeScreen(navigationShell: navigationShell);
        },
        branches: [
          StatefulShellBranch(
            routes: [
              StatefulShellRoute.indexedStack(
                builder: (context, state, child) =>
                    DashboardScreen(child: child),
                // redirect: (_, _) => '/dashboard/new-ticket',
                branches: [
                  StatefulShellBranch(
                    routes: [
                      GoRoute(
                        path: '/dashboard/public',
                        name: 'public',
                        builder: (context, state) => PublicScreen(),
                      ),
                    ],
                  ),
                  StatefulShellBranch(
                    routes: [
                      GoRoute(
                        path: '/dashboard/new-ticket',
                        name: 'new-ticket',
                        builder: (context, state) => NewTicketScreen(),
                      ),
                    ],
                  ),
                  StatefulShellBranch(
                    routes: [
                      GoRoute(
                        path: '/dashboard/index-component',
                        name: 'index-component',
                        builder: (context, state) => IndexScreen(),
                      ),
                    ],
                  ),
                  StatefulShellBranch(
                    routes: [
                      GoRoute(
                        path: '/dashboard/update-app',
                        name: 'update-app',
                        builder: (context, state) => UpdateAppScreen(),
                      ),
                    ]
                  )
                  // GoRoute(
                  //   path: '/dashboard/public',
                  //   name: 'public',
                  //   builder: (context, state) => PublicScreen(),
                  // ),
                  // GoRoute(
                  //   path: '/dashboard/new-ticket',
                  //   name: 'new-ticket',
                  //   builder: (context, state) => NewTicketScreen(),
                  // ),
                  // GoRoute(
                  //   path: '/dashboard/index-component',
                  //   name: 'index-component',
                  //   builder: (context, state) => IndexScreen(),
                  // ),
                ],
              ),
            ],
          ),
        ],
      ),
    ],
  );
});

// }

// TODO: Integrar una funcion para ejecutar Guards
String? _executeGuards(
  BuildContext context,
  GoRouterState state,
  Ref ref,
  List<RouteGuard> guards,
) {
  for (final guard in guards) {
    final redirectPath = guard.check(context, state, ref);
    if (redirectPath != null) return redirectPath;
  }
  return null;
}
