import 'dart:ffi';

import 'package:diet_app/model/diary.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DBListService{

  Future<Database> initializeDB() async {
    String path = await getDatabasesPath();
    return openDatabase(
      join(path, 'user.db'), // Database 생성 
  // create table 구문 실행 
    onCreate: (db, version) { 
      return db.execute( 
        "create table userInfo(email text, formattedDate text, diarycontent text, workcontent text, breakfast text, lunch text, dinner text, waterAmount int, health text)", 
        ); 
      },
      version: 1,
    );
  }

  Future<int> infoInsert(Diary diary) async{
    int result = 0;
    Database db = await initializeDB();
    result = await db.rawInsert(
          'insert into userInfo (email, formattedDate, diarycontent, workcontent, breakfast, lunch, dinner, waterAmount, health) values (?,?,?,?,?,?,?,?,?)',
          [diary.email, diary.formattedDate, diary.diarycontent, diary.workcontent,diary.breakfast, diary.lunch, diary.dinner, diary.waterAmount, diary.health]);
    return result;
  }
// DIARY 수정하기
Future<int> infoUpdate(Diary diary, String beforeDate) async{
    int result = 0;
    Database db = await initializeDB();
    result = await db.rawUpdate(
          'update userInfo SET formattedDate = ?, diarycontent = ?, workcontent = ?, breakfast = ?, lunch = ?, dinner = ?, waterAmount = ?, health = ? WHERE email = ? and formattedDate = ?',
                        [diary.formattedDate, diary.diarycontent, diary.workcontent, diary.breakfast, diary.lunch, diary.dinner, diary.waterAmount, diary.health, diary.email, beforeDate]);
    return result;
}

  Future<List<dynamic>> infoRead(String email, String formattedDate) async{
    List result = [];
    Database db = await initializeDB();
    result=await db.rawQuery('select * from userInfo where email = ? and formattedDate = ?',[email, formattedDate]);
    return result;
  }
  // 데이터 베이스 Read
  Future<List<Diary>> retrieveUsers() async {
    final Database db = await initializeDB();
    final List<Map<String, Object?>> queryResult =
        await db.rawQuery('select * from userInfo');
    return queryResult.map((e) => Diary.fromMap(e)).toList();
  }
 
    Future<void> deleteUser(String email, String formattedDate) async {
    final db = await initializeDB();
    await db.rawDelete('delete from userInfo where email = ? and formattedDate = ?', [email, formattedDate]);
  }

  // 등록여부 확인 찾기 
  Future<int> checkContent(String email, String formattedDate) async {
    var res;
    Database db = await initializeDB();
    res = await db.rawQuery('SELECT * FROM userInfo WHERE email = ? and formattedDate =?', [email, formattedDate]);
    if(res.length == 0){
      return 0;
    } else{
      return 1;
    }
  }

   Future<void> deleteUserAll(String email) async {
    final db = await initializeDB();
    await db.rawDelete('delete from userInfo where email = ? ', [email]);
  }


}