import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:socket_io_client/socket_io_client.dart';
import 'package:template_flutter_test/shared/socket/config/socket_status.dart';
import 'package:template_flutter_test/shared/socket/socket_instance.dart';
import 'package:template_flutter_test/shared/widgets/toast/toast_services.dart';

final socketProvider = NotifierProvider<SocketNotifier, SocketState>(() {
  return SocketNotifier();
});

class SocketNotifier extends Notifier<SocketState> {
  @override
  SocketState build() {
    
    //? Se conecta al socket
    final socketInstance = SocketInstance().socket;

    socketInstance?.onConnect((_) {
      ToastService.showToast(title: 'Conectado', message: 'Se ha conectado con el servidor', type: 'success');
      state = state.copyWith(status: SocketInfo.connected);
    });

    socketInstance?.onReconnect((_) {
      ToastService.showToast(title: 'Reconectado', message: 'Se ha reconectado con el servidor', type: 'warning');
      state = state.copyWith(status: SocketInfo.reconnecting);
    });

    socketInstance?.onDisconnect((_) {
      ToastService.showToast(title: 'Desconectado', message: 'Se ha perdido la conexion con el servidor', type: 'error');
      state = state.copyWith(status: SocketInfo.disconnected);
    });

    socketInstance?.onError((e) {
      ToastService.showToast(title: 'Error', message: '$e', type: 'error');
      state = state.copyWith(status: SocketInfo.error);
    });

    return SocketState(
      status: (SocketInstance().isConnected) 
          ? SocketInfo.connected 
          : SocketInfo.connecting
    );
  }

  void connect(String token) {
    state = state.copyWith(status: SocketInfo.connecting);
    // SocketInstance().socket?.io.options?['auth'] = {'token': token};
    SocketInstance().socket?.connect();
  }

  void disconnect() {
    state = state.copyWith(status: SocketInfo.disconnected);
    SocketInstance().socket?.disconnect();
  }

  void close() {
    state = state.copyWith(status: SocketInfo.disconnected);
    SocketInstance().socket?.close();
  }

}

class SocketState {

  final SocketInfo status;

  SocketState({required this.status});

  SocketState copyWith({SocketInfo? status}) {
    return SocketState(status: status ?? this.status);
  }
}