import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:uuid/uuid.dart';

Future<String> uploadImage(File image) async {
  var uuid = new Uuid();
  StorageReference reference =
      FirebaseStorage.instance.ref().child('images/${uuid.v1()}');
  StorageUploadTask uploadTask = reference.putFile(image);

  StorageTaskSnapshot downloadUrl = (await uploadTask.onComplete);

  String location = (await downloadUrl.ref.getDownloadURL());
  print("URL: $location");
  return location;
}
