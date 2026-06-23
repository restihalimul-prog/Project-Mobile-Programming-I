import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:uuid/uuid.dart';

class StorageService {
  final FirebaseStorage storage = FirebaseStorage.instance;

  Future<String> uploadImage(File imageFile) async {
    final fileName = const Uuid().v4();

    final ref = storage.ref().child('destinations').child('$fileName.jpg');

    await ref.putFile(imageFile);

    return await ref.getDownloadURL();
  }

  Future<void> deleteImage(String imageUrl) async {
    try {
      await FirebaseStorage.instance.refFromURL(imageUrl).delete();
    } catch (e) {
      print(e);
    }
  }
}
