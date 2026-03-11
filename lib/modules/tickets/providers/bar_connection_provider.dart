import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:template_flutter_test/shared/providers/connectivity/connectivity_provider.dart';

final barVisibleProvider = NotifierProvider<BarConnectionNotifier, bool>((){
  return BarConnectionNotifier();
});

class BarConnectionNotifier extends Notifier<bool>{

  @override
  bool build() {

    ref.listen(globalConnectionProvider, (previous, next) {

      // if (previous?.status != next.status) {
      state = true;
      Future.delayed(const Duration(seconds: 2), () {
        if(
          next.status == ConnectionState.online
        ) {
          state = false;
        }
      });
      // }
    });

    return false;
  }
  
}