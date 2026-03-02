import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:socket_io_client/socket_io_client.dart';
import 'package:template_flutter_test/shared/socket/socket_instance.dart';

enum SocketStatus { initial, connecting, connected, disconnected, error }

final socketProvider = NotifierProvider<SocketNotifier, SocketState>(() {
  return SocketNotifier();
});

class SocketNotifier extends Notifier<SocketState> {
  @override
  SocketState build() {
    // TODO: Se debe conectar al socket
    final socketInstance = SocketInstance();

    socketInstance.socket!.onConnect((_) {
      state = state.copyWith(status: SocketStatus.connected);
    });

    socketInstance.socket!.onDisconnect((_) {
      state = state.copyWith(status: SocketStatus.disconnected);
    });

    socketInstance.socket!.onError((error) {
      state = state.copyWith(status: SocketStatus.error);
    });

    return socketInstance.isConnected
        ? SocketState(status: SocketStatus.connected)
        : SocketState(status: SocketStatus.initial);
  }

  void connect(String token) {
    state = state.copyWith(status: SocketStatus.connecting);
    // SocketInstance().socket?.io.options?['auth'] = {'token': token};
    SocketInstance().socket?.connect();
  }

}

class SocketState {
  final SocketStatus status;

  SocketState({required this.status});

  SocketState copyWith({SocketStatus? status}) {
    return SocketState(status: status ?? this.status);
  }
}
