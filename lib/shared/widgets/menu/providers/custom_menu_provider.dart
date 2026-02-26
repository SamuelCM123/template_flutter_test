
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:template_flutter_test/router/routes/index.dart';

final selectedMenuIndex = Provider.family<int, String>((ref, location) {
  final locationIndex = MenuItem.appMenu.indexWhere((item) => item.name == location);
  return locationIndex == -1 ? 0 : locationIndex;
});
