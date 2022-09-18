import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'datamodel.dart';

ValueNotifier<List<Cameramodel>> imageListNotifier = ValueNotifier([]);

Future<void> captureimage(Cameramodel value) async {
  final imageDB = await Hive.openBox<Cameramodel>('image DB');
  final id = await imageDB.add(value);
  value.id = id;
  imageListNotifier.value.add(value);
  await imageDB.put(id, value);
  

  imageListNotifier.notifyListeners();
  getallImages();
}

Future<void> getallImages() async {
  final imageDB = await Hive.openBox<Cameramodel>('image DB');
  imageListNotifier.value.clear();
  imageListNotifier.value.addAll(imageDB.values);
  imageListNotifier.notifyListeners();
}

Future<void> deleteimag(int id) async {
  final imageDB = await Hive.openBox<Cameramodel>('image DB');
  imageDB.delete(id);
  getallImages();
}

Future<void> clearAllStudents() async {
  final galleryDB = await Hive.openBox<Cameramodel>('image DB');
  imageListNotifier.value.clear();
  galleryDB.clear(); 
}
