import 'dart:async';
import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:flutter/cupertino.dart';

class FirebaseStorageService {
  Future<String> uploadImage(File image, String folderName) async {
    var fileName = image.path.split("/").last;

    final reference = firebase_storage.FirebaseStorage.instance
        .ref()
        .child('$folderName/$fileName');
    firebase_storage.UploadTask uploadTask = reference.putFile(image);
    // final StreamSubscription<StorageTaskEvent> streamSubscription =
    uploadTask.snapshotEvents.listen((event) {});

    firebase_storage.TaskSnapshot snapshot = await uploadTask.whenComplete(() {
      debugPrint("Image upload Completed");
    });
    final imgUrl = await snapshot.ref.getDownloadURL();
    // streamSubscription.cancel();
    return imgUrl;
  }
}
