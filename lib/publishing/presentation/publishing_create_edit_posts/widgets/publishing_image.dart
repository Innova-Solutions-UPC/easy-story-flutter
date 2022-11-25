import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

ElevatedButton PublishingImage(data, String urlImage) {
  final ImagePicker _picker = ImagePicker();
  return ElevatedButton(
    onPressed: () async {
      final prefs = await SharedPreferences.getInstance();

      var image = await _picker.pickImage(source: ImageSource.gallery);
      if (image != null) {
        data = image;
        await prefs.setString('fileRecent', image.path);

        print(prefs.getString('fileRecent'));
      }
    },
    child: Text("Subir una Imagen"),
  );
}
