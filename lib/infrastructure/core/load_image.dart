import 'dart:typed_data';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:mobilite_moderne/PRESENTATION/core/_utils/dev_utils.dart';

Future<Uint8List?>? loadImage(Reference storageRef, String? path) async {
  printDev();
  try {
    //Chargement de l'image
    if (path != "" && path != null) {
      final imgRef = storageRef.child(path);
      const tenMegabyte = 1024 * 1024 * 10;
      return await imgRef.getData(tenMegabyte);
    }
    print('Erreur lors du chargement de l\'image MOBILE : path vide');
    return null;
  } catch (e) {
    print('Erreur lors du chargement de l\'image MOBILE');
    print(e);
  }
}

Future<String>? loadImageWeb(Reference storageRef, String? path) {
  printDev();
  try {
    //Chargement de l'image
    if (path != "" && path != null) {
      /* final qsdf = path;
      final result = storageRef.child(qsdf).getDownloadURL();
 */
      return null;
    }
    return null;
  } catch (e) {
    print('Erreur lors du chargement de l\'image WEB');
    print(e);
    return null;
  }
}
