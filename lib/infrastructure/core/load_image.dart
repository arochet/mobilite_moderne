import 'dart:typed_data';

import 'package:firebase_storage/firebase_storage.dart';

Future<Uint8List?>? loadImage(Reference storageRef, String? path) {
  try {
    //Chargement de l'image
    if (path != "" && path != null) {
      final imgRef = storageRef.child(path);
      const tenMegabyte = 1024 * 1024 * 10;
      return imgRef.getData(tenMegabyte);
    }
    return null;
  } catch (e) {
    print('Erreur lors du chargement de l\'image MOBILE');
    print(e);
  }
}

Future<String>? loadImageWeb(Reference storageRef, String? path) {
  try {
    //Chargement de l'image
    if (path != "" && path != null) {
      return storageRef.child(path).getDownloadURL();
    }
    return null;
  } catch (e) {
    print('Erreur lors du chargement de l\'image WEB');
    print(e);
    return null;
  }
}
