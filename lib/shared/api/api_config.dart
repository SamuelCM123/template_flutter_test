import 'package:template_flutter_test/shared/constants/env/env_config.dart';

class ApiConfig {

  // TODO: Configuración de la API
  static String apiAppUrl = EnvConfig.apiAppUrl; //? URL base de la API
  static String apiAuthUrl = EnvConfig.apiAuthUrl; //? URL base de la API de autenticación
  static int timeout = EnvConfig.timeout; //? Tiempo de espera en segundos
  static Map<String, dynamic> headers = {
    'Content-Type': 'application/json; charset=utf-8',
  };



}
