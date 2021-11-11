import 'dart:async';
import 'dart:io';
import 'dart:convert';
import 'oop.dart';
main() async{

  
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
  
  
  var load = loadSomeThings("Hello from Async Dart!").then((str) => print(str));
  var waiter = await loadByDelay("Hello from Async Dart");
  
  examplesStream(10).listen((int x) {
    print("String : $x"); 
    }
    );

  Stream strm = examplesStream(3000000);
  await for (var s in strm){
    File file = File('text.txt');
    IOSink sink = file.openWrite(mode: FileMode.append);
    sink.add(utf8.encode("$s\n"));
    await sink.flush();
    await sink.close();
  }  

  File file = File("text.txt");
  Stream<List<int>> fileStream = file.openRead();
  fileStream.transform(utf8.decoder).transform(LineSplitter()).listen(
    (str) => {print(str) }, 
    onDone: () => print("Done Reading File"),
    onError: (e) => e.toString() 
    );
      



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
  await Future.delayed(Duration(seconds: 2));
  return("String : $str");

}

//stream
Stream<int> examplesStream(int x) async* {
  for(int i=0 ; i<=x ; i++){
    yield i;
  }
}


