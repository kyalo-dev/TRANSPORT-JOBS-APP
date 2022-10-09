// import 'dart:io';

// import 'package:firebase_storage/firebase_storage.dart';
// import 'package:flutter/material.dart';

// class UploadImages{
//   Future<List<String>> uploadFiles(List<File> images) async {
//   var imageUrls = await Future.wait(images.map((image) => uploadFile(image)));
//   debugPrint(imageUrls.map((e) => e).toList().toString());
//   return imageUrls;
// }

// Future<String> uploadFile(File image) async {
//   Reference storageReference = FirebaseStorage.instance
//       .ref()
//       .child('documents/${image.path.split('/').last}');
//   UploadTask uploadTask = storageReference.putFile(image);
//   await uploadTask.whenComplete(() => debugPrint('${image.path.split('/').last} uploaded'));

//   return await storageReference.getDownloadURL();
// }
// }
import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';

class UploadImages{
  Future<List<Map<String,dynamic>>> uploadFiles(List<Map<String,dynamic>> images) async {
  List<Map<String,dynamic>> imageUrls = await Future.wait(images.map((image) => uploadFile(image)));
  debugPrint(imageUrls.map((e) => e).toList().toString());
  return imageUrls;
}

Future<Map<String,dynamic>> uploadFile(Map<String,dynamic> image) async {
  Reference storageReference = FirebaseStorage.instance
      .ref()
      .child('listings/${File(image['path']).path.split('/').last}');
  UploadTask uploadTask = storageReference.putFile(File(image['path']));
  await uploadTask.whenComplete(() => debugPrint('${File(image['path']).path.split('/').last} uploaded'));

  return {
    'name':image['name'],
    'path':await storageReference.getDownloadURL()
  };
}
}