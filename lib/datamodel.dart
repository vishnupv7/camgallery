import 'package:hive_flutter/hive_flutter.dart';
 part 'datamodel.g.dart';

@HiveType(typeId: 1)
class Cameramodel{
  @HiveField(0)
  int? id;
  @HiveField(1)

  final String image;
 Cameramodel({this.id,required this.image});
}
