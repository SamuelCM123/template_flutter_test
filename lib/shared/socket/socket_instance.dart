import 'package:socket_io_client/socket_io_client.dart' as IO;
import 'package:template_flutter_test/shared/constants/env/env_config.dart';

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
      .build()
    );
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