import 'package:template_flutter_test/shared/constants/env/env_config.dart';
import 'package:web_socket_channel/web_socket_channel.dart';
import 'dart:convert';

class SocketInstancePure {
  static final SocketInstancePure _singleton = SocketInstancePure._internal();
  factory SocketInstancePure() => _singleton;
  SocketInstancePure._internal();

  WebSocketChannel? _channel;
  bool _isConnected = false;

  bool get isConnected => _isConnected;

  // En WebSockets puros, la URL debe empezar con ws:// o wss://
  void connect() {
    if (_isConnected) return;

    try {
      _channel = WebSocketChannel.connect(Uri.parse(EnvConfig.socketUrlPure));
      _isConnected = true;
      print('🚀 Conectado a WebSocket puro: ${EnvConfig.socketUrlPure}');
    } catch (e) {
      _isConnected = false;
      print('❌ Error al conectar: $e');
    }
  }

  // Para escuchar eventos (como tu on-working-on-ticket)
  Stream get stream => _channel!.stream;

  void emit(dynamic data) {
    // En ws puro, usualmente enviamos JSON strings
    _channel?.sink.add(jsonEncode(data));
  }

  void disconnect() {
    _channel?.sink.close();
    _isConnected = false;
  }
}