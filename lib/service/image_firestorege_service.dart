import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';

class IMageFirestoregeService {
  final _ImageStorage = FirebaseStorage.instance;

  Future<String> addImage(String name, File file) async {
    final imageRefrenc = _ImageStorage.ref().child("products").child("images").child("$name.jpg");
    final uploadTask = imageRefrenc.putFile(file);
    uploadTask.snapshotEvents.listen((value) {
      print(value.state);
    });
    return await imageRefrenc.getDownloadURL();
  }
}
