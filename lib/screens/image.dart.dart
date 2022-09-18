import 'dart:io';

import 'package:flutter/material.dart';

class CapturedImage extends StatelessWidget {
  final String path;
  const CapturedImage({Key? key, required this.path}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(7),
      decoration: const BoxDecoration(),
      child: ClipRRect(
        child: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: FileImage(File(path)), fit: BoxFit.fill)),
        ),
      ),
    );
  }
}
