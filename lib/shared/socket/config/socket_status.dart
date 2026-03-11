import 'package:flutter/services.dart';

class SocketInfo {

  final String title;
  final Color color;

  SocketInfo({required this.title, required this.color});

  static SocketInfo connected     = SocketInfo(title: 'Conectado', color: Color(0xFF77BC79) );
  static SocketInfo connecting    = SocketInfo(title: 'Conectando', color: Color(0xFFFACC15) );
  static SocketInfo disconnected  = SocketInfo(title: 'Desconectado', color: Color(0xFFDA0000));
  static SocketInfo error         = SocketInfo(title: 'Error', color: Color(0xFFDA0000));
  static SocketInfo reconnecting  = SocketInfo(title: 'Reconectando', color: Color(0xFFFACC15));

}