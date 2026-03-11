import 'package:encrypt/encrypt.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

abstract class EnvConfig {
  static String apiAppUrl = dotenv.env['API_APP_URL'] ?? '';
  static String apiAuthUrl = dotenv.env['API_AUTH_URL'] ?? '';
  static String socketUrlPure = dotenv.env['SOCKET_URL_PURE'] ?? '';
  static String socketUrlIO = dotenv.env['SOCKET_URL_IO'] ?? '';
  static Key encryptKey = Key.fromUtf8(dotenv.env['ENCRYPT_KEY'] ?? '');
  static int timeout = int.tryParse(dotenv.env['TIMEOUT'] ?? '30000') ?? 30;
}