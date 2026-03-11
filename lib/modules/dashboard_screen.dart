import 'package:flutter/material.dart' hide ConnectionState;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:template_flutter_test/modules/tickets/providers/bar_connection_provider.dart';
import 'package:template_flutter_test/shared/providers/connectivity/connectivity_provider.dart';
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
    // // print  ('location: $location');
    final providerTitle = ref.watch(selectedMenuTitle(location!));
    final providerIndex = ref.watch(selectedMenuIndex(location));
    final connection = ref.watch(globalConnectionProvider);
    final isBarVisible = ref.watch(barVisibleProvider);

    return Scaffold(
      key: scaffoldKey,
      drawer: CustomMenu(
        scaffoldKey: scaffoldKey,
        selectIndexMenu: providerIndex,
      ),
      appBar: AppBar(
        backgroundColor: Color(0xFF293277),
        foregroundColor: Colors.white,
        shadowColor: Colors.black,
        animateColor: true,
        title: Text(providerTitle),
      ),
      body: Column(
        children: [
          Stack(
            children: [
              AnimatedContainer(
                duration: Duration(milliseconds: 300),
                color: connection.color,
                height: isBarVisible ? 20 : 0,
                width: double.infinity,
                child: Center(
                  child: Text(
                    connection.title,
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 10),
          Expanded(
            child: AnimatedContainer(
              duration: Duration(seconds: 2),
              child: widget.child,
            ),
          ),
        ],
      ),
    );
  }
}
