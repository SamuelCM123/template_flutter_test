import 'package:flutter_dotenv/flutter_dotenv.dart';

abstract class EnvConfig {
  static String apiAppUrl = dotenv.env['API_APP_URL'] ?? '';
  static String apiAuthUrl = dotenv.env['API_AUTH_URL'] ?? '';
  static String socketUrl = dotenv.env['SOCKET_URL'] ?? '';
  static int timeout = int.tryParse(dotenv.env['TIMEOUT'] ?? '30000') ?? 30;
}