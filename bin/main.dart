import 'oop.dart';
import 'dart:async';
void main() async{

  //
  var student = Student();
  student.phonNumber_set = 123456789;
  
  print(student.phonNumber_get);
  var person = Information();
  person.name = "The King";
  person.family = "Of Flutter";

  person.hello();
  var person2 = Education();
  person2.message();

  var pride = Car('111' , 2017 , 150);
  var shower  = pride.showInputs();
  print(shower);
  print(pride.showText());
  
  //
  loadSomeThings("Hello from Async Dart!").then((str) => print(str));
  var waiter = await loadByDelay("Hello from Async Dart");
  print(waiter);

}


Future<String> loadSomeThings(String str){
  //
  return Future.delayed(
    Duration(seconds: 10)).then((_) => "String: $str"
    );
}




Future<String> fetchUserOrder() =>
    // Imagine that this function is more complex and slow.
    Future.delayed(
      const Duration(seconds: 2),
      ( ) => "sbdhsg"
    );



Future<String> loadByDelay(String str) async {
  await Future.delayed(Duration(seconds: 10));
  return("String : $str");

}