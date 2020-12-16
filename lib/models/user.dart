class User {
  final String name;
  final int age;
  final List<String> profs;

  User({this.name, this.age, this.profs});

  copyWith({String name, int edad, List<String> profs}) => User(
      name: name ?? this.name,
      age: edad ?? this.age,
      profs: profs ?? this.profs);
}
