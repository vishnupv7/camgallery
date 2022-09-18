import 'package:camgallery/datamodel.dart';
import 'package:camgallery/screens/HomeScreen.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';

Future <void> main()  async{
  await Hive.initFlutter();
 if(!Hive.isAdapterRegistered(CameramodelAdapter().typeId))
 {
   Hive.registerAdapter(CameramodelAdapter());
 }
  
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
       debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
       
        primarySwatch: Colors.blue,
      ),
      home: const HomeScreen()
    );
  }
}

