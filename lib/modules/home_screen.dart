import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:template_flutter_test/shared/widgets/menu/custom_menu.dart';

class HomeScreen extends ConsumerStatefulWidget {

  final StatefulNavigationShell navigationShell;

  const HomeScreen({super.key, required this.navigationShell});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {

  @override
  Widget build(BuildContext context) {

    // TODO: Agregar el menu de componentes
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Screen'),
      ),
      body: widget.navigationShell
    );
  }

}