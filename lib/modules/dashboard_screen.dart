import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:template_flutter_test/shared/widgets/menu/providers/custom_menu_provider.dart';
import 'package:template_flutter_test/shared/widgets/menu/widgets/custom_menu.dart';

class DashboardScreen extends ConsumerStatefulWidget {

  final Widget child;

  const DashboardScreen({super.key, required this.child});

  @override
  ConsumerState<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends ConsumerState<DashboardScreen> {

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    final location = GoRouterState.of(context).topRoute?.name;
    print('location: $location');
    final providerTitle = ref.watch(selectedMenuTitle(location!));
    final providerIndex = ref.watch(selectedMenuIndex(location));
  
    return Scaffold(
      key: scaffoldKey,
      drawer: CustomMenu(
        scaffoldKey: scaffoldKey,
        selectIndexMenu: providerIndex,
      ),
      appBar: AppBar(
        title: Text(providerTitle),
      ),
      body: SafeArea(child: widget.child),
    );
  }
}