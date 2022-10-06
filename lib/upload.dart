import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';

class UploadImage{
Future<String> uploadFile(File image) async {
  Reference storageReference = FirebaseStorage.instance
      .ref()
      .child('images/${image.path}');
  UploadTask uploadTask = storageReference.putFile(image);
  await uploadTask.whenComplete(() => debugPrint('${image.path} uploaded'));

  return await storageReference.getDownloadURL();
}}