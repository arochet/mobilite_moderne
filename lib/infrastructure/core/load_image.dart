import 'dart:typed_data';

import 'package:firebase_storage/firebase_storage.dart';

Future<Uint8List?> loadImage(Reference storageRef, String path) async {
  try {
    //Chargement de l'image

    if (path != "") {
      final imgRef = storageRef.child(path);
      const tenMegabyte = 1024 * 1024 * 10;
      final data = await imgRef.getData(tenMegabyte);
      return data;
    } else {}
  } catch (e) {
    print('Erreur lors du chargement de l\'image MOBILE');
    print(e);
  }
}

Future<String> loadImageWeb(Reference storageRef, String path) async {
  try {
    //Chargement de l'image
    if (path != "") {
      return await storageRef.child(path).getDownloadURL();
    }
    return "";
  } catch (e) {
    print('Erreur lors du chargement de l\'image WEB');
    print(e);
    return "";
  }
}
