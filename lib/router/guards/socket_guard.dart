
import 'package:go_router/src/state.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:template_flutter_test/router/guards/repository/index.dart';

class SocketGuard implements RouteGuard {

  @override
  String? check(BuildContext context, GoRouterState state, Ref ref) {

    // TODO: Acceder al provider del socket para verificar su estado
    // TODO: Verificar si el socket esta conectado

    return null;
  }
  
}