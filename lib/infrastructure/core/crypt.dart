import 'package:mobilite_moderne/config_reader.dart';
import 'package:encrypt/encrypt.dart';

/// Retourne une chaine cryptée<br>
/// On utilise une clé secrète qui n'est pas stocké dans Github<br>
String crypt(String str) {
  final key = Key.fromUtf8(ConfigReader.getSecretKey());
  final iv = IV.fromLength(16);
  final encrypter = Encrypter(AES(key, mode: AESMode.ecb));
  final strEncrypted = encrypter.encrypt(str, iv: iv);
  return strEncrypted.base64;
}
