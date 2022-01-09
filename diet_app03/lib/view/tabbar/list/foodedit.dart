import 'package:diet_app/message/message.dart';
import 'package:diet_app/service/dblistservice.dart';
import 'package:diet_app/view/tabbar/list/modify.dart';
import 'package:diet_app/view/tabbar/tabbarnavigator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FoodEdit extends StatefulWidget {
  const FoodEdit({ Key? key }) : super(key: key);

  @override
  _FoodEditState createState() => _FoodEditState();
}

class _FoodEditState extends State<FoodEdit> {

  TextEditingController breakfastcontroller = TextEditingController(); 
  TextEditingController lunchcontroller = TextEditingController();
  TextEditingController dinnercontroller = TextEditingController(); 
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    breakfastcontroller.text = Message.breakfast;
    lunchcontroller.text = Message.lunch;
    dinnercontroller.text = Message.dinner;
  }

  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green[100],
        title: Image.asset('images/smallLogo.png',
          width: 100,
          height: 100,
        )
      ),
      body: Center(
        
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
        
              // 아침식사
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                child: Container(
                  width: 330,
                  decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.yellow[200],
                          border: Border.all(
                          color: Colors.black,
                          style: BorderStyle.solid,
                          width: 1,
                          )
                        ),
                  child: const Padding(
                    padding: EdgeInsets.fromLTRB(110, 5, 100, 5),
                    child:  Text('아침식단',
                      style:  TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'GowunDodum',
                        letterSpacing: 4
                      ),
                    ),
                  ),
                ),
              ),
                 
              //아침식사 내용 
              Container(
                width: 330,
                height: 200,
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                    child: CupertinoTextField(
                      controller: breakfastcontroller,
                      decoration: BoxDecoration(
                        color: Colors.yellow[200],
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                        color: Colors.black,
                        style: BorderStyle.solid,
                        width: 1
                        )
                      ),
                      keyboardType: TextInputType.multiline,
                      maxLines: 10,
                    ),
                ),
              ),
        
               // 점심식사
              Container(
                width: 330,
                decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.deepOrange[100],
                        border: Border.all(
                        color: Colors.black,
                        style: BorderStyle.solid,
                        width: 1
                        )
                      ),
                child: const Padding(
                  padding: EdgeInsets.fromLTRB(110, 5, 100, 5),
                  child: Text('점심식단',
                    style:  TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'GowunDodum',
                      letterSpacing: 4
                    ),
                  ),
                ),
              ),
                 
              //점심식사 내용 
              Container(
                width: 330,
                height: 200,
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                    child: CupertinoTextField(
                      
                      controller: lunchcontroller,
                      decoration: BoxDecoration(
                        color: Colors.deepOrange[100],
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                        color: Colors.black,
                        style: BorderStyle.solid,
                        width: 1
                        )
                      ),
                      keyboardType: TextInputType.multiline,
                      maxLines: 10,
                    ),
                ),
              ),
        
        
        
               // 저녁식사
              Container(
                width: 330,
                decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.lightBlue[100],
                        border: Border.all(
                        color: Colors.black,
                        style: BorderStyle.solid,
                        width: 1
                        )
                      ),
                child: const Padding(
                  padding: EdgeInsets.fromLTRB(110, 5, 100, 5),
                  child: Text('저녁식단',
                    style:  TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'GowunDodum',
                      letterSpacing: 4
                    ),
                  ),
                ),
              ),
                 
              //저녁식사 내용 
              Container(
                width: 330,
                height: 200,
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                    child: CupertinoTextField(
                      
                      controller: dinnercontroller,
                      decoration: BoxDecoration(
                        color: Colors.lightBlue[100],
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                        color: Colors.black,
                        style: BorderStyle.solid,
                        width: 1
                        )
                      ),
                      keyboardType: TextInputType.multiline,
                      maxLines: 10,
                    ),
                ),
              ),
        

              Padding(
                padding: const EdgeInsets.fromLTRB(0, 0, 0, 20),
                child: Container(
                  width: 330,
                  height: 40,
                  child: ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.deepPurple[900])
                    ),
                    onPressed: (){
                      Message.breakfast = breakfastcontroller.text.toString();
                      Message.lunch = lunchcontroller.text.toString();
                      Message.dinner = dinnercontroller.text.toString();
                      DBListService db = DBListService();
                     
                      db.infoRead(Message.email, Message.formattedDate);



                     Navigator.push(context, MaterialPageRoute(builder: (context){
                     return const ModifyPage();
                    }));
                    }, 
                    child: const Text('건강하게,먹자',
                      style: TextStyle(
                        fontSize: 20,
                        fontFamily: 'GowunDodum',
                        letterSpacing: 12
                      ),
                    )
                  ),
                ),
              )
        
            ],
          ),
        ),
      ),
    );
  }
}