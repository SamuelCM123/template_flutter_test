import 'package:flutter/material.dart';
import 'package:template_flutter_test/shared/widgets/menu/widgets/custom_menu.dart';

class DashboardScreen extends StatefulWidget {

  final Widget child;

  const DashboardScreen({super.key, required this.child});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      drawer: CustomMenu(scaffoldKey: scaffoldKey),
      appBar: AppBar(
        title: const Text('Dashboard Screen'),
      ),
      body: widget.child,
    );
  }
}