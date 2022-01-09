import 'package:diet_app/message/message.dart';
import 'package:diet_app/model/user.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DBservice{
  
  Future<Database> initializeDB() async {
    String path = await getDatabasesPath();
    return openDatabase(
      join(path, 'diary.db'), // Database 생성 
  // create table 구문 실행 
    onCreate: (db, version) { 
      return db.execute( 
        "create table customer(email text, password text, nickname text)", 
        ); 
      },
      version: 1,
    );
  }


  //insert 
  Future<int> insertUser(User users) async {
    int result = 0;
    Database db = await initializeDB();
    result = await db.rawInsert(
          'insert into customer (email, password, nickname) values (?,?,?)',
          [users.email, users.password, users.nickname]);
    return result;
  }

  Future<int> getlogin(String email, String password) async {
    var res;
    int count = 0;
    Database db = await initializeDB();
    res = await db.rawQuery('SELECT * FROM customer WHERE email = ? and password = ?', [email, password]);
    if(res.length == 0){
      count = 0;
    }else{
      Message.email = res[0]['email'];
      Message.nickname = res[0]['nickname'];
      count = 1;
      User.fromMap(res.first);
    }
    return count;
  }




  // 비밀번호 찾기 
  Future<String> getPassword(String email) async {
    var res;
    Database db = await initializeDB();
    res = await db.rawQuery('SELECT password FROM customer WHERE email = ?', [email]);
    if(res.length == 0){
      return "null";
    } else{
      return res[0]['password'];
    }
  }

  // 로그아웃 
   void logout(String email) async {
    var res;
    Database db = await initializeDB();
    res = await db.rawQuery('SELECT email FROM customer WHERE email = ?', [email]);
  }

  
  // 등록여부 확인 찾기 
  Future<int> checkContent(String email) async {
    var res;
    Database db = await initializeDB();
    res = await db.rawQuery('SELECT * FROM customer WHERE email = ?', [email]);
    if(res.length == 0){
      return 0;
    } else{
      return 1;
    }
  }

 
}