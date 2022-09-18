import 'package:camgallery/screens/image.dart.dart';
import 'package:camgallery/screens/largepreviewScreen.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../datamodel.dart';
import '../dbfunction.dart';
import 'package:lottie/lottie.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    getallImages();
      // clearAllStudents();
   
    super.initState();
  }

  late String _imageData;
  late int length;

  @override
  Widget build(BuildContext context) {
   
    //  clearAllStudents();
    return Scaffold(
      
      backgroundColor: const Color.fromARGB(255, 116, 183, 250),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(252, 3, 215, 215),
        title: const Text(
          'CAMERA APP',
          textAlign: TextAlign.start,
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
              onPressed: () {
                imagepic();
              },
              icon: const Icon(Icons.camera))
        ],
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(15),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
        child: ValueListenableBuilder(
          valueListenable: imageListNotifier,
          builder: (BuildContext context, List<Cameramodel> imageList,
              Widget? child) {
            length = imageList.length;
            return (length == 0)
                ? Center(
                    child: Lottie.network(
                        "https://assets3.lottiefiles.com/packages/lf20_jhlaooj5.json",
                        animate: true),
                  )
                : GridView.builder(
                    itemBuilder: (BuildContext context, int index) {
                      final data = imageList[index];
                      return InkWell(
                        onTap:(){
                              Navigator.of(context).push(MaterialPageRoute(builder: (context) => ShowImage(image:  imageList[index].image, index:index) ));
                          
                          

                        } ,
                        onDoubleTap: () {
                        
                              _showDialog(context, data.id!);
                        
                         
                        },
                        child: CapturedImage(
                          path: data.image,
                        ),
                      );
                    },
                    itemCount: imageList.length,
                    gridDelegate:
                        const SliverGridDelegateWithMaxCrossAxisExtent(
                            maxCrossAxisExtent: 200,
                            crossAxisSpacing: 7,
                            mainAxisSpacing: 7),
                  );
          },
        ),
      ),
    );
  }

  Future<void> imagepic() async {
    final image = await ImagePicker().pickImage(source: ImageSource.camera);
    if (image == null) {
      return;
    }
    _imageData = image.path;
    final picture = Cameramodel(image: _imageData);
    captureimage(picture);
  }
  
  _showDialog(BuildContext context, int id) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Expanded(
          child: AlertDialog(
            title: const Text('Confirm'),
            content: const Text('Are you sure you want to delete?'),
            actions: [
              TextButton(
                onPressed: () {
                  deleteimag(id);
                  Navigator.of(context).pop();
                },
                child: const Text(
                  'YES',
                  style: TextStyle(color: Colors.black),
                ),
              ),
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text(
                  'NO',
                  style: TextStyle(color: Colors.black),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
 
