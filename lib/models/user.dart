import 'package:meta/meta.dart';

class User {
  String name;
  int age;
  List<String> profs;

  User({@required this.name, this.age, this.profs}) : assert(name != null);
}
