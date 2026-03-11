import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:template_flutter_test/shared/socket/providers/socket_provider.dart';

class HomeScreen extends ConsumerStatefulWidget {
  final StatefulNavigationShell navigationShell;

  const HomeScreen({super.key, required this.navigationShell});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    // TODO: PROVIDER PARA OBTENER EL STATUS DE LA CONEXION (SOCKET)
    // final socket = ref.watch(socketProvider).status;

    // TODO: Agregar el menu de componentes
    return Scaffold(
      body: widget.navigationShell,
    );
  }
}
