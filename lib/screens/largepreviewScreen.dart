import 'dart:io';
import 'package:camgallery/dbfunction.dart';
import 'package:flutter/material.dart';


class ShowImage extends StatefulWidget {
  const ShowImage({Key? key, required this.image, required this.index})
      : super(key: key);
  final String image;
  final int index;
  @override
  State<ShowImage> createState() => _ShowImageState();
}

class _ShowImageState extends State<ShowImage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 116, 183, 250),
      appBar: AppBar(
         backgroundColor: const Color.fromARGB(252, 3, 215, 215),
        title: const Text('Image'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: SafeArea(
            child: Column(
              children: [
                Container(
                  width: 500,
                  height: 600,
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(10)),
                  child: Image.file(File(widget.image)),
                ),
             
              ],
            ),
          ),
        ),
      ),
    );
  }
 

}