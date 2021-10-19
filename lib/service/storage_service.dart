import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';

class StorageService {
  final FirebaseStorage _firebaseStorage = FirebaseStorage.instance;

  Future<String> uploadMedia(File file) async {
    var media = _firebaseStorage
        .ref()
        .child(
            "${DateTime.now().millisecondsSinceEpoch}.${file.path.split('.').last}")
        .putFile(file);

    media.snapshotEvents.listen((event) {});
    var storageRef = await media;
    return await storageRef.ref.getDownloadURL();
  }
}
