
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:template_flutter_test/router/routes/index.dart';

final selectedMenuIndex = Provider.family<int, String>((ref, location) {
  final itemsToShow = MenuItem.appMenu.where((item) => item.isShow).toList();
  final locationIndex = itemsToShow.indexWhere((item) => item.name == location);
  print('locationIndex: $locationIndex');
  return locationIndex == -1 ? 0 : locationIndex;
});

final selectedMenuTitle = Provider.family<String, String>((ref, location) {
  final item = MenuItem.appMenu.firstWhere((item) => item.name == location);
  print('item: $item');
  return item.title;
});
