import 'package:hive/hive.dart';
part 'datas.g.dart';
@HiveType(typeId: 0)
class data extends HiveObject {

  @HiveField(0)
  String name;

  @HiveField(1)
  String number;

  data(this.name,this.number);
}