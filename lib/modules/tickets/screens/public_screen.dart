import 'package:flutter/material.dart';

class PublicScreen extends StatefulWidget {

  const PublicScreen({super.key});

  @override
  State<PublicScreen> createState() => _PublicScreenState();
}

class _PublicScreenState extends State<PublicScreen> {
  @override

  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
      // TODO: Implementar los tickets en los que se estan trabajando
    ));
  }
}