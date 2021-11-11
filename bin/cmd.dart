import 'dart:io';
void main() {
  stdout.writeln("please inter your Name: ");
  String? name = stdin.readLineSync();

  stdout.writeln("Pleas inter your Lastname :");
  String? lastname = stdin.readLineSync();

  stdout.writeln("Please inter your Age:");
  String? age = stdin.readLineSync();

  var Info = Map();
  Info['name'] = name;
  Info['Lastname'] = lastname;
  Info['Age'] = age;

  Info.forEach((key, value) { 
    print("$key : $value");
  });

}