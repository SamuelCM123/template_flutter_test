

import 'package:template_flutter_test/shared/constants/env/env_config.dart';

class SocketConfig {

  //? TODO: CONFIGURAR LOS RECURSOS CENTRALIZADOS NECESARIOS PARA LA CONFIGURACIÓN DE LOS SOCKETS
  /**
   ** 1- Verificar el tiempo del hearbeat
   ** 2- Maximo de reconexiones
   ** 3- Intervalos de reconexión
   ** 4- URL del socket
   */

  int heartbeatInterval = 30000; //? Intervalo del heartbeat en milisegundos
  int maxReconnectionAttempts = 5; //? Máximo de intentos de reconexión
  int reconnectionInterval = 5000; //? Intervalo entre intentos de reconexión en milisegundos
  static String socketUrl = EnvConfig.socketUrl; //? URL del socket obtenida de las variables de entorno

  SocketConfig({
    required this.heartbeatInterval,
    required this.maxReconnectionAttempts,
    required this.reconnectionInterval,
  });

}