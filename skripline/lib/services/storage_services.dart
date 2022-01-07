import 'dart:io' as i;
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';
import 'package:firebase_storage/firebase_storage.dart';

class StorageServices {
  static Future<String> uploadImage(XFile imageFile) async {
    String fileName = basename(imageFile.path);
    Reference ref = FirebaseStorage.instance.ref().child(fileName);
    UploadTask task = ref.putFile(i.File(imageFile.path));

    TaskSnapshot snapshot =
        await task.whenComplete(() async => await ref.getDownloadURL());
    return await snapshot.ref.getDownloadURL();
  }
}
