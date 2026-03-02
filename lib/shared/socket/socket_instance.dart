import 'package:socket_io_client/socket_io_client.dart' as IO;
import 'package:template_flutter_test/shared/constants/env/env_config.dart';

// TODO: Configuración de la instancia del SOCKET
class SocketInstance {

  static final SocketInstance _singleton = SocketInstance._internal();
  factory SocketInstance() => _singleton;
  SocketInstance._internal();

  IO.Socket? _socket;

  IO.Socket? get socket => _socket;
  bool get isConnected => _socket?.connected ?? false;

  void connect({
    required String url,
  }){
    _socket = IO.io(
      EnvConfig.socketUrl,
      IO.OptionBuilder()
      .setTransports(['websocket'])
      // .setAuth(auth)
      .enableAutoConnect()
      .build()
    );
    print('Socket connected: ${_socket?.connected}');
    _socket?.connect();
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