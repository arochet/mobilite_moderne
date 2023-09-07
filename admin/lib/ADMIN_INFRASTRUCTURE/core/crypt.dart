import 'package:mobilite_moderne/config_reader.dart';
import 'package:encrypt/encrypt.dart';

String crypt(String str) {
  final key = Key.fromUtf8(ConfigReader.getSecretKey());
  final iv = IV.fromLength(16);
  final encrypter = Encrypter(AES(key));
  final strEncrypted = encrypter.encrypt(str, iv: iv);
  return strEncrypted.base64;
}
