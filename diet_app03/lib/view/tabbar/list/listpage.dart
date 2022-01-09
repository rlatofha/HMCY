import 'package:diet_app/message/message.dart';
import 'package:diet_app/model/diary.dart';
import 'package:diet_app/service/dblistservice.dart';
import 'package:diet_app/view/tabbar/list/modify.dart';
import 'package:diet_app/view/tabbar/tabbarnavigator.dart';
import 'package:diet_app/view/tabbar/selectpage.dart';
import 'package:flutter/material.dart';

class ListPage extends StatefulWidget {
  const ListPage({ Key? key }) : super(key: key);

  @override
  _ListPageState createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
  late DBListService handler;

  // 색상값
  Color waterColor = Colors.black87;
  Color actColor = Colors.black87;
  Color mealColor = Colors.black87;

  @override
  void initState() {
    super.initState();
    handler = DBListService();
  }

  @override
  Widget build(BuildContext context) {
  return Scaffold(
      body: FutureBuilder(
        future: handler.retrieveUsers(),
        builder: (BuildContext context, AsyncSnapshot<List<Diary>> snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data?.length,
              itemBuilder: (BuildContext context, int index) {
                return Dismissible(
                  direction: DismissDirection.endToStart,
                  background: Container(
                    color: Colors.red,
                    alignment: Alignment.centerRight,
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: const Icon(Icons.delete_forever),
                  ),
                  key: ValueKey<String>(snapshot.data![index].email),
                  onDismissed: (DismissDirection direction) async {
                    await handler.deleteUser(snapshot.data![index].email, snapshot.data![index].formattedDate);
                    setState(() {
                      snapshot.data!.remove(snapshot.data![index]);
                    });
                  },
                  child: GestureDetector(
                    child: Card( // 카드 형태
                      child: Column(
                        children: [
                          Container( // 날짜 표기 공간
                            height: 50,                
                            decoration: BoxDecoration(              
                            color: Colors.grey,
                            border: Border.all(
                            color: Colors.grey,
                            style: BorderStyle.solid,
                            width: 1,
                            ),
                          ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
                                  child: Text(snapshot.data![index].formattedDate, // 작성일자
                                    style: const TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                      fontFamily: 'GowunDodum',
                                    ),  
                                  ),
                                ),

                                Padding(
                                  padding: const EdgeInsets.fromLTRB(100, 0, 0, 0),
                                  child: IconButton(
                                    iconSize: 20,
                                    onPressed: (){
                                      Message.formattedDate = snapshot.data![index].formattedDate;
                                      Message.content = snapshot.data![index].diarycontent;
                                      Message.workcontent = snapshot.data![index].workcontent;
                                      Message.breakfast = snapshot.data![index].breakfast;
                                      Message.lunch = snapshot.data![index].lunch;
                                      Message.dinner = snapshot.data![index].dinner;
                                      Message.waterAmount = snapshot.data![index].waterAmount;
                                      Message.health= snapshot.data![index].health;
                                      Navigator.push(context, MaterialPageRoute(builder: (context){
                                      return const ModifyPage();
                                      }));

                                    },
                                    icon: const Icon(Icons.edit,
                                      color: Colors.white,
                                    )
                                  ),
                                ),


                                 Padding(
                                  padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                                  child: IconButton(
                                    iconSize: 20,
                                    onPressed: (){
                                      checkDelete(snapshot.data![index].email,snapshot.data![index].formattedDate);
                                    },
                                    icon: const Icon(Icons.delete_outlined,
                                      color: Colors.white,
                                    )
                                  ),
                                ),
                              ],
                            ),
                          ),

                            Container( // 본문 공간
                                height: 130,             
                                decoration: BoxDecoration(              
                                color: Colors.white,
                                  border: Border.all(
                                  color: Colors.grey,
                                  style: BorderStyle.solid,
                                  width: 1,
                                  ),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                     
                                      Padding(
                                        padding: const EdgeInsets.fromLTRB(10, 0, 0, 20),
                                        child: SizedBox(
                                          height: 40,
                                          child: Text(
                                            snapshot.data![index].diarycontent,// 다이어리 텍스트
                                            style: const TextStyle(
                                              fontSize: 30,
                                              color: Colors.black87,
                                              fontFamily: 'GowunDodum',
                                            ),
                                          ),
                                        ),
                                      ),



                                      SizedBox( // 아이콘
                                        height: 35,
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            Icon(
                                              Icons.opacity,
                                              color: check_W(snapshot.data![index].waterAmount),// 물에 대해 값이 있으면 파란색
                                              size: 30,
                                            ),
                                            const SizedBox(width: 45,),
                                            Icon(
                                              Icons.fitness_center,
                                              color: check_A(snapshot.data![index].health),// 운동에 대해 값이 있으면 파란색
                                              size: 30,
                                            ),
                                            const SizedBox(width: 45,),
                                            Icon(
                                              Icons.restaurant,
                                              color: check_M(snapshot.data![index].breakfast,snapshot.data![index].lunch,snapshot.data![index].dinner),// 식사에 대해 값이 있으면 파란색
                                              size: 30,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                            ),
                        ],
                      )
                    ),
                    onLongPress: (){
                      _AllDeleteshowDialog(context);
                    },
                    onTap: (){
                       Message.formattedDate = snapshot.data![index].formattedDate;
                       Message.content = snapshot.data![index].diarycontent;
                       Message.workcontent = snapshot.data![index].workcontent;
                       Message.breakfast = snapshot.data![index].breakfast;
                       Message.lunch = snapshot.data![index].lunch;
                       Message.dinner = snapshot.data![index].dinner;
                       Message.waterAmount = snapshot.data![index].waterAmount;
                       Message.health= snapshot.data![index].health;
                     Navigator.push(context, MaterialPageRoute(builder: (context){
                     return const SelectPage();
                     }));
                    },
                  ),
                );
              },
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
  // 물 값 체크
  Color check_W(int waterAmount){
    if (waterAmount == 0) {
        waterColor = Colors.black87;
    } else {
        waterColor = Colors.blue;
    }
    return waterColor;
  }
  // 운동 값 체크
  Color check_A(String health){
    if (health.length == 0) {
        actColor = Colors.black87;
    } else {
        actColor = Colors.blue;
    }
    return actColor;
  }
  // 식사 값 체크
  Color check_M(String breakfast, String lunch, String dinner){
    int sum;
    sum = breakfast.length + lunch.length + dinner.length;
   
    if (sum == 0) {
        mealColor = Colors.black87;
    } else {
        mealColor = Colors.blue;
    }
    return mealColor;
  }

  void checkDelete(String email, String formattedDate){
      DBListService db = DBListService();
      db.deleteUser(email,formattedDate);
      _checkDeleteshowDialog(context);
  }

  _checkDeleteshowDialog(BuildContext context){
    showDialog(
      context: context, 
      builder: (BuildContext context){
          return AlertDialog(
            title: const Text('삭제 확인',
              style: TextStyle(
                fontFamily: 'GowunDodum',
              ),
            ),
            content: const Text('정말로 삭제 하시겠습니까?',
              style: TextStyle(
                fontFamily: 'GowunDodum',
              ),
            ),
            actions:[
              TextButton(
                onPressed: (){
                  Navigator.of(context).pop();
                  Navigator.push(context, MaterialPageRoute(builder: (context){
                  return const TabNavigator();
                  }));
                },
                child: const Text('확인',
                  style: TextStyle(
                    fontFamily: 'GowunDodum',
                  ),
                ),
              ),
              TextButton(onPressed: (){
                Navigator.of(context).pop();
              }, child: const Text('취소',
                  style: TextStyle(
                    fontFamily: 'GowunDodum',  
                  ),
                ),)
              

              
            ],
          );
        }
      );
  }

   _AllDeleteshowDialog(BuildContext context){
    showDialog(
      context: context, 
      builder: (BuildContext context){
          return AlertDialog(
            title: const Text('전체삭제',
              style: TextStyle(
                fontFamily: 'GowunDodum',
              ),
            ),
            content: const Text('정말로 삭제 하시겠습니까?',
              style: TextStyle(
                fontFamily: 'GowunDodum',
              ),
            ),
            actions:[
              TextButton(
                onPressed: (){
                  DBListService db = DBListService();
                  db.deleteUserAll(Message.email);
                  Navigator.of(context).pop();
                  Navigator.push(context, MaterialPageRoute(builder: (context){
                  return const TabNavigator();
                  }));
                },
                child: const Text('확인',
                  style: TextStyle(fontFamily: 'GowunDodum',),
                ),
              ),
              TextButton(onPressed: (){
                Navigator.of(context).pop();
              }, child: const Text('취소',
                  style: TextStyle(
                    fontFamily: 'GowunDodum',  
                  ),
                ),
              ),
            ],
          );
        }
      );
  }
}




