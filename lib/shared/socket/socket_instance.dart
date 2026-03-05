import 'package:socket_io_client/socket_io_client.dart' as IO;
import 'package:template_flutter_test/shared/constants/env/env_config.dart';
import 'package:template_flutter_test/shared/widgets/toast/toast_services.dart';

// TODO: Configuración de la instancia del SOCKET
class SocketInstance {

  static final SocketInstance _singleton = SocketInstance._internal();
  factory SocketInstance() => _singleton;
  SocketInstance._internal();

  IO.Socket? _socket;

  IO.Socket? get socket => _socket;
  bool get isConnected => _socket?.connected ?? false;

  void connect(){
    
    if(_socket != null && _socket!.connected) return;

    _socket = IO.io(
      EnvConfig.socketUrlIO,
      IO.OptionBuilder()
      // .setAuth(auth ?? {})
      .setPath('/ws-io')
      .setTransports(['websocket'])
      .enableAutoConnect()
      .enableReconnection()
      .setReconnectionAttempts(5)
      .build()
    );
    // _socket?.connect();
    print('Socket connected: ${_socket?.connected}');
    _socket!.onConnect((e) => {
      // print('Socket connected: ${e}'),
      ToastService.showToast(title: 'Conectado', message: 'Se ha conectado con el servidor', type: 'success')
    });
    _socket!.onConnectError((e) {
      ToastService.showToast(title: 'Error', message: '$e', type: 'error');
    });
    _socket!.onDisconnect((_) {
      ToastService.showToast(title: 'Desconectado', message: 'Se ha perdido la conexion con el servidor', type: 'error');
    });
  }

  void disconnect(){
    _socket?.disconnect();
  }

  void close(){
    _socket?.close();
  }

  void emit(String event, dynamic data){
    _socket?.emit(event, data);
  }

  void on(String event, Function(dynamic) callback){
    _socket?.on(event, callback);
  }

  void off(String event){
    _socket?.off(event);
  }

}