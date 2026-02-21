import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

abstract class RouteGuard {
  String? check(BuildContext context, GoRouterState state, Ref ref);
}