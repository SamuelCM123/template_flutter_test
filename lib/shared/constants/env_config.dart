import 'package:flutter_dotenv/flutter_dotenv.dart';

abstract class EnvConfig {
  static String apiUrl = dotenv.env['API_URL'] ?? '';
  static String socketUrl = dotenv.env['SOCKET_URL'] ?? '';
  static int timeout = int.tryParse(dotenv.env['TIMEOUT'] ?? '30') ?? 30;
}