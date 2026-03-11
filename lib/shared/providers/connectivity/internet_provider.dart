import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final internetNotifierProvider = NotifierProvider<InternetNotifier, InternetState>((){
  return InternetNotifier();
});


final internetProvider = StreamProvider.autoDispose((ref) {
  return Connectivity().onConnectivityChanged;
});

class InternetNotifier extends Notifier<InternetState> {

  @override
  InternetState build() {
    
    final connectivity = ref.watch(internetProvider).value ?? [];
    if (connectivity.contains(ConnectivityResult.none) || connectivity.isEmpty) {
      return InternetState(isConnected: false);
    }

    return InternetState(isConnected: true);
  }

}

class InternetState {

  final bool isConnected;
  
  InternetState({required this.isConnected});

}