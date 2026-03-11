import 'dart:ui';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:template_flutter_test/shared/providers/connectivity/internet_provider.dart';
import 'package:template_flutter_test/shared/socket/config/socket_status.dart';
import 'package:template_flutter_test/shared/socket/providers/socket_provider.dart';

enum ConnectionState { online, connecting, offline }

final globalConnectionProvider = Provider<ConnectivityStatus>((ref) {

  final hasInternet = ref.watch(internetNotifierProvider).isConnected;
  final socketStatus = ref.watch(socketProvider).status;
  print('socketStatus: $socketStatus');
  print('hasInternet: $hasInternet');

  //? Prioridad 0: No hay internet físico
  if (!hasInternet) {
    return ConnectivityStatus.offlineInternet;
  }

  //? Prioridad 1: Hay internet, pero el socket está caído/conectando
  if (socketStatus == SocketInfo.disconnected || socketStatus == SocketInfo.error) {
    print('error: $socketStatus');
    return ConnectivityStatus.offlineSocket;
  }

  //? Prioridad 2: Procesando la conexión
  if (socketStatus == SocketInfo.connecting) {
    return ConnectivityStatus.connecting;
  }

  //? Prioridad 3: Hay internet y el socket se encuentra conectado
  return ConnectivityStatus.connected;
});

class ConnectivityStatus {
  final ConnectionState status;
  final String title;
  final Color color;

  ConnectivityStatus({required this.status, required this.title, required this.color});

  static ConnectivityStatus connected = ConnectivityStatus(title: 'Conectado', color: Color(0xFF77BC79), status: ConnectionState.online);
  static ConnectivityStatus connecting = ConnectivityStatus(title: 'Conectando', color: Color(0xFFFACC15), status: ConnectionState.connecting);
  static ConnectivityStatus offlineInternet = ConnectivityStatus(title: 'Sin Conexión a Internet', color: Color(0xFFDA0000), status: ConnectionState.offline);
  static ConnectivityStatus offlineSocket = ConnectivityStatus(title: 'Sin Conexión a Estación', color: Color(0xFFDA0000), status: ConnectionState.offline);
}