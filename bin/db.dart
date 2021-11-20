import 'dart:developer';
import 'dart:ffi';
import 'dart:io';
import 'dart:async';
import 'package:galileo_sqljocky5/constants.dart';
import 'package:galileo_sqljocky5/internal/auth/auth_handler.dart';
import 'package:galileo_sqljocky5/internal/auth/character_set.dart';
import 'package:galileo_sqljocky5/internal/auth/handshake_handler.dart';
import 'package:galileo_sqljocky5/internal/auth/ssl_handler.dart';
import 'package:galileo_sqljocky5/internal/comm/buffered_socket.dart';
import 'package:galileo_sqljocky5/internal/comm/comm.dart';
import 'package:galileo_sqljocky5/internal/comm/common.dart';
import 'package:galileo_sqljocky5/internal/comm/receiver.dart';
import 'package:galileo_sqljocky5/internal/comm/sender.dart';
import 'package:galileo_sqljocky5/internal/comm/task_queue.dart';
import 'package:galileo_sqljocky5/internal/common/logging.dart';
import 'package:galileo_sqljocky5/internal/connection/impl.dart';
import 'package:galileo_sqljocky5/internal/handlers/debug_handler.dart';
import 'package:galileo_sqljocky5/internal/handlers/handler.dart';
import 'package:galileo_sqljocky5/internal/handlers/ok_packet.dart';
import 'package:galileo_sqljocky5/internal/handlers/parameter_packet.dart';
import 'package:galileo_sqljocky5/internal/handlers/ping_handler.dart';
import 'package:galileo_sqljocky5/internal/handlers/quit_handler.dart';
import 'package:galileo_sqljocky5/internal/handlers/use_db_handler.dart';
import 'package:galileo_sqljocky5/internal/prepared_statement_handler/close_statement_handler.dart';
import 'package:galileo_sqljocky5/internal/prepared_statement_handler/execute_query_handler.dart';
import 'package:galileo_sqljocky5/internal/prepared_statement_handler/prepare_handler.dart';
import 'package:galileo_sqljocky5/internal/prepared_statement_handler/prepare_ok_packet.dart';
import 'package:galileo_sqljocky5/internal/prepared_statement_handler/prepared_query.dart';
import 'package:galileo_sqljocky5/internal/query_handler/query_stream_handler.dart';
import 'package:galileo_sqljocky5/internal/query_handler/result_set_header_packet.dart';
import 'package:galileo_sqljocky5/internal/result_parser/binary_data_packet.dart';
import 'package:galileo_sqljocky5/internal/result_parser/standard_data_packet.dart';
import 'package:galileo_sqljocky5/public/connection/connection.dart';
import 'package:galileo_sqljocky5/public/connection/settings.dart';
import 'package:galileo_sqljocky5/public/exceptions/client_error.dart';
import 'package:galileo_sqljocky5/public/exceptions/exceptions.dart';
import 'package:galileo_sqljocky5/public/exceptions/mysql_exception.dart';
import 'package:galileo_sqljocky5/public/exceptions/protocol_error.dart';
import 'package:galileo_sqljocky5/public/results/blob.dart';
import 'package:galileo_sqljocky5/public/results/field.dart';
import 'package:galileo_sqljocky5/public/results/future.dart';
import 'package:galileo_sqljocky5/public/results/results.dart';
import 'package:galileo_sqljocky5/public/results/row.dart';
import 'package:galileo_sqljocky5/sqljocky.dart';
import 'package:galileo_sqljocky5/utils/buffer.dart';
import 'package:password_strength/password_strength.dart';
import 'package:string_validator/string_validator.dart';
Future main() async{


  var s = ConnectionSettings(
    user: "root",
    password: "admin1234",
    host: "localhost",
    port: 3306,
    db: "dart",
  );




  // mysql connection
  var conn = await MySqlConnection.connect(s);


  while(true){

  //User Commend Line
  stdout.writeln("************* \n Welcome to Dart Commendline Registery\n ************* \n Please inter Your Username : ");
  final username = stdin.readLineSync();

  stdout.writeln("Pleas inter your Password:");
  final password = stdin.readLineSync();

  stdout.writeln("Please Confirm the Password!");
  final cpass = stdin.readLineSync();
    
  var passStrenght = estimatePasswordStrength(password.toString());
    

    if( passStrenght > 0.3 && password == cpass){
      
      var insetData =  await conn.execute("INSERT INTO `admin` (`id`, `username`, `password`) VALUES (NULL, '$username', '$password')");
      stdout.writeln("Your Account Created Succecful !");
      break;
        
    }else if (passStrenght < 0.3) {
      print(" \n Your Password is Weak please try again! \n");
      
    }else{
      print(" \n Your Password is not Match Please Try Again! \n");
      
    }


  }

  // // mysql select db
  var results = await conn.execute('select username, password from admin');

  results.forEach((Row row) {
  // Access columns by index
  print('\n ----------------------------------------------------------------------------------------- \n |    userName    |    ${row[0]}  ||    Password:    |    ${row[1]}    |');
  // // Access columns by name
  // //print('Name: ${row.name}, email: ${row.email}');
  });
  
}