import 'dart:typed_data';

import 'package:firebase_storage/firebase_storage.dart';

Future<Uint8List?> loadImage(Reference storageRef, String path) async {
  try {
    //Chargement de l'image

    if (path != "") {
      final imgRef = storageRef.child(path);
      const oneMegabyte = 1024 * 1024;
      return imgRef.getData(oneMegabyte);
    } else {}
  } catch (e) {
    print('Erreur lors du chargement de l\'image');
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
    print('Erreur lors du chargement de l\'image');
    print(e);
    return "";
  }
}
