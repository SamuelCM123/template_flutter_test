// TODO: Configuración de la instancia del SOCKET
import 'package:template_flutter_test/shared/socket/socket_config.dart';

class SocketInstance implements SocketConfig {
  @override
  int heartbeatInterval;

  @override
  int maxReconnectionAttempts;

  @override
  int reconnectionInterval;

  SocketInstance({
    this.heartbeatInterval = 30000,
    this.maxReconnectionAttempts = 5,
    this.reconnectionInterval = 5000,
  });

}