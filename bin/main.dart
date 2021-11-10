import 'oop.dart';

void main() {

  //
  var student = new Student();
  student.phonNumber_set = 123456789;
  
  print(student.phonNumber_get);
  var person = new Information();
  person.name = "The King";
  person.family = "Of Flutter";

  person.hello();
  var person2 = new Education();
  person2.message();


}