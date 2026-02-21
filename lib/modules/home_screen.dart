import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class HomeScreen extends ConsumerStatefulWidget {

  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
  
}