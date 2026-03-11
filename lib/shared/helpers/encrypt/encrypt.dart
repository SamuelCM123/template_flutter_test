import 'dart:convert';
import 'dart:typed_data';
import 'package:encrypt/encrypt.dart';
import 'package:convert/convert.dart'; // Para hex.decode
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pointycastle/export.dart' as pc;

enum EncryptMode {
  gcm(AESMode.gcm),
  ctr(AESMode.ctr);

  final AESMode mode;

  const EncryptMode(this.mode);
}

class EncryptService {
  // NOTA: Estas deben ser exactamente las mismas que en tu backend Node.js
  final String _passphrase = "samuel123"; 
  final String _salt = 'salt'; 
  final EncryptMode modeEncrypt;
  
  late Key _secretKey;
  final int _ivBytesLength = 16;

  EncryptService({ 
    this.modeEncrypt = EncryptMode.gcm
  }) {
    _initKey();
  }

  void _initKey() {
    final Uint8List password = Uint8List.fromList(utf8.encode(_passphrase));
    final Uint8List saltBytes = Uint8List.fromList(utf8.encode(_salt));
    
    // Replicamos scryptSync(key, 'salt', 32) de Node
    final pc.Scrypt derivator = pc.Scrypt()
      ..init(pc.ScryptParameters(16384, 8, 1, 32, saltBytes));
    
    _secretKey = Key(derivator.process(password));
  }

  String decrypt(String cipherTextHex) {
    try {

      final Uint8List fullBytes = Uint8List.fromList(hex.decode(cipherTextHex));
      final Uint8List ivBytes = fullBytes.sublist(0, _ivBytesLength);
      final iv = IV(ivBytes);
      final Uint8List payload = fullBytes.sublist(_ivBytesLength);
      print('payload: $payload');
      print('modeEncrypt:${modeEncrypt.mode}');
      final encrypter = Encrypter(AES(_secretKey, mode: modeEncrypt.mode));
      
      return encrypter.decrypt(Encrypted(payload), iv: iv);
    } catch (e) {
      return "Error: $e";
    }
  }
}

// Provider para usarlo en toda la app
final encryptServiceProvider = Provider((ref){
  return EncryptService(modeEncrypt: EncryptMode.gcm);
});