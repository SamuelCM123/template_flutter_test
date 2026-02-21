import 'package:flutter/material.dart';

class IndexScreen extends StatefulWidget {

  const IndexScreen({super.key});

  @override
  State<IndexScreen> createState() => _IndexScreenState();
}

class _IndexScreenState extends State<IndexScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Index Screen'),
      ),
      body: const Center(
        child: Text('Index Screen'),
      ),
    );
  }
}