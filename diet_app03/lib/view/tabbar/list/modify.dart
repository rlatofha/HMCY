import 'package:diet_app/message/message.dart';
import 'package:diet_app/model/diary.dart';
import 'package:diet_app/service/dblistservice.dart';
import 'package:diet_app/view/tabbar/list/foodedit.dart';
import 'package:diet_app/view/tabbar/tabbarnavigator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';
import 'package:carousel_slider/carousel_slider.dart';


class ModifyPage extends StatefulWidget {
  const ModifyPage({ Key? key }) : super(key: key);

  @override
  _ModifyPageState createState() => _ModifyPageState();
}

class _ModifyPageState extends State<ModifyPage> {  
  late String formattedDate;
  late var select;

  TextEditingController contentcontroller = TextEditingController(); 
  TextEditingController workcontroller = TextEditingController();

  late int count1;
  late int count2;
  late int count3;
  late int count4;
  late int count5;
  late int count6;
  late int count7;
  late int count8;

  
  late Color _color1;
  late Color _color2;
  late Color _color3;
  late Color _color4;
  late Color _color5;
  late Color _color6;
  late Color _color7;
  late Color _color8;

  late String breakfast;
  late String lunch;
  late String dinner;

  late var waterAmount;
  String beforeDate = Message.formattedDate;
  
  TextEditingController healthcontroller = TextEditingController();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _color1=Message.color1;
    _color2=Message.color2;
    _color3=Message.color3;
    _color4=Message.color4;
    _color5=Message.color5;
    _color6=Message.color6;
    _color7=Message.color7;
    _color8=Message.color8;
    
    count1 = Message.count1;
    count2 = Message.count2;
    count3 = Message.count3;
    count4 = Message.count4;
    count5 = Message.count5;
    count6 = Message.count6;
    count7 = Message.count7;
    count8 = Message.count8;

    waterAmount = Message.waterAmount;

    DateTime select = DateTime.now();

    formattedDate = DateFormat('yyyy년 MM월 dd일').format(select);



    contentcontroller.text = Message.content;
    workcontroller.text = Message.workcontent;
    healthcontroller.text = Message.health;
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
               // 날짜 지정
              Container(
                width: 350,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.red[50],
                  border: Border.all(
                  color: Colors.black,
                  style: BorderStyle.solid,
                  width: 1,
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
                      child: Text(Message.formattedDate,
                        style: const TextStyle(
                          fontSize: 20, 
                          fontWeight: FontWeight.bold,
                          fontFamily: 'GowunDodum',
                        ),   
                      ),
                    ),
            
                    Padding(
                      padding: const EdgeInsets.fromLTRB(110, 0, 0, 0),
                      child: IconButton(
                        iconSize: 20,
                        onPressed: (){
                          setState(() {
                            showDatePickerPop();
                          });
                        },
                        icon: const Icon(Icons.calendar_today_outlined)
                      ),
                    ),
                  ],
                ),
              ),
            
              //Diary
              Container(
                width: 350,
                height: 300,
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                    child: CupertinoTextField(
                      controller: contentcontroller,
                      decoration: BoxDecoration(
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
            
              // 오늘의 감사한 일 
              Container(
                width: 350,
                height: 50,
                decoration: BoxDecoration(
                    color: Colors.lime[200],
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                    color: Colors.black,
                    style: BorderStyle.solid,
                    width: 1
                  ),
                ),
            
                child: const Padding(
                  padding:  EdgeInsets.fromLTRB(20, 10, 0, 10),
                  child:  Text("오늘의 감사한 일",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'GowunDodum',
                    ),
                  ),
                ),
              ),
              //오늘의 감사한 일 내용 
              Container(
                width: 350,
                height: 150,
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                    child: CupertinoTextField(
                      controller: workcontroller,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                        color: Colors.black,
                        style: BorderStyle.solid,
                        width: 1,
                        
                        )
                      ),
                      keyboardType: TextInputType.multiline,
                      maxLines: 10,
                    ),
                ),
              ),
             
              _buildTop(),


                // 물 마시기  
               Container(
                 width: 350,
                 child: const Padding(
                   padding: EdgeInsets.fromLTRB(10, 20, 0, 0),
                   child:  Text('물마시기',
                   style: TextStyle(
                     fontSize: 16,
                     fontWeight: FontWeight.bold,
                     fontFamily: 'GowunDodum',
                     letterSpacing: 4
                   ),
                  ),
                 ),
               ),
            
               // 물 icon 8개
              Container(
                width: 350,
                 decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  //color: Colors.red[50],
                  border: Border.all(
                  color: Colors.black,
                  style: BorderStyle.solid,
                  width: 2,
                  ),
                ),
                child: Row(
                  children: [
            
                  Padding(
                    padding: const EdgeInsets.fromLTRB(10, 5, 0, 5),
                    child: Container(
                      width: 30,
                      child: IconButton(
                       onPressed: (){
                         setState(() {
                          count1++;
                          if(count1 == 1){
                            _color1=Colors.blue;
                            waterAmount += count1;
                          }else{
                            count1 = 0;
                            waterAmount -= 1;
                            _color1=Colors.black87;
                          }
                         });
                       }, 
                       icon: Icon(Icons.opacity,
                        color: _color1,
                        size: 35
                       )
                      ),
                    ),
                  ),
            
                  Padding(
                    padding: const EdgeInsets.fromLTRB(10, 5, 0, 5),
                    child: Container(
                      width: 30,
                      child: IconButton(
                       onPressed: (){
                         setState(() {
                          count2++;
                          
                          if(count2 == 1){
                            _color2=Colors.blue;
                            waterAmount += count2;
                          }else{
                            count2=0;
                            waterAmount -= 1;
                            _color2=Colors.black87;
                          }
                         });
                       }, 
                       icon: Icon(Icons.opacity,
                        color: _color2,
                        size:35
                       )
                      ),
                    ),
                  ),
                  
                  Padding(
                    padding: const EdgeInsets.fromLTRB(10, 5, 0, 5),
                    child: Container(
                      width: 30,
                      child: IconButton(
                       onPressed: (){
                         setState(() {
                          count3++;
                          if(count3 == 1){
                            _color3=Colors.blue;
                            waterAmount += count3;
                          }else{
                            count3=0;
                            waterAmount -= 1;
                            _color3=Colors.black87;
                          }
                         });
                       }, 
                       icon: Icon(Icons.opacity,
                        color: _color3,
                        size: 35
                       )
                      ),
                    ),
                  ),
            
                  Padding(
                    padding: const EdgeInsets.fromLTRB(10, 5, 0, 5),
                    child: Container(
                      width: 30,
                      child: IconButton(
                       onPressed: (){
                         setState(() {
                          count4++;
                          
                          if(count4 == 1){
                            _color4=Colors.blue;
                            waterAmount += count4;
                          }else{
                            count4=0;
                            waterAmount -= 1;
                            _color4=Colors.black87;
                          }
                         });
                       }, 
                       icon: Icon(Icons.opacity,
                        color: _color4,
                        size: 35
                       )
                      ),
                    ),
                  ),
                  
                  Padding(
                    padding: const EdgeInsets.fromLTRB(10, 5, 0, 5),
                    child: Container(
                      width: 30,
                      child: IconButton(
                       onPressed: (){
                         setState(() {
                          count5++;
                          
                          if(count5 == 1){
                            _color5=Colors.blue;
                            waterAmount += count5;
                          }else{
                            count5=0;
                            waterAmount -= 1;
                            _color5=Colors.black87;
                          }
                         });
                       }, 
                       icon: Icon(Icons.opacity,
                        color: _color5,
                        size: 35
                       )
                      ),
                    ),
                  ),
            
                  Padding(
                    padding: const EdgeInsets.fromLTRB(10, 5, 0, 5),
                    child: Container(
                      width: 30,
                      child: IconButton(
                       onPressed: (){
                         setState(() {
                          count6++;
                         
                          if(count6 == 1){
                            _color6=Colors.blue;
                            waterAmount += count6;
                          }else{
                            count6=0;
                            waterAmount -= 1;
                            _color6=Colors.black87;
                          }
                         });
                       }, 
                       icon: Icon(Icons.opacity,
                        color: _color6,
                        size: 35
                       )
                      ),
                    ),
                  ),
            
                  Padding(
                    padding: const EdgeInsets.fromLTRB(10, 5, 0, 5),
                    child: Container(
                      width: 30,
                      child: IconButton(
                       onPressed: (){
                         setState(() {
                          count7++;
                          
                          if(count7 == 1){
                            _color7=Colors.blue;
                            waterAmount += count7;
                          }else{
                            count7=0;
                            waterAmount -= 1;
                            _color7=Colors.black87;
                          }
                         });
                       }, 
                       icon: Icon(Icons.opacity,
                        color: _color7,
                        size: 35
                       )
                      ),
                    ),
                  ),
            
                  Padding(
                    padding: const EdgeInsets.fromLTRB(10, 5, 0, 5),
                    child: Container(
                      width: 30,
                      child: IconButton(
                       onPressed: (){
                         setState(() {
                          count8++;
                         
                          if(count8 == 1){
                            _color8=Colors.blue;
                            waterAmount += count8;
                          }else{
                            count8=0;
                            waterAmount -= 1;
                            _color8=Colors.black87;
                          }
                         });
                       }, 
                       icon: Icon(Icons.opacity,
                        color: _color8,
                        size: 35
                       )
                      ),
                    ),
                  ),
                  ],
                ),
              ),
               
            
              
               // 운동 기록 
               Container(
                 width: 350,
                 child: const Padding(
                   padding: EdgeInsets.fromLTRB(10, 20, 0, 0),
                   child:  Text('운동기록',
                   style: TextStyle(
                     fontSize: 16,
                     fontWeight: FontWeight.bold,
                     fontFamily: 'GowunDodum',
                     letterSpacing: 4
                   ),
                  ),
                 ),
               ),
               // 운동 기록 입력 
            
               Container(
                 width: 350,
                 height: 150,
                  decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                  color: Colors.black,
                  style: BorderStyle.solid,
                  width: 2,
                  ),
                ),
                 child: CupertinoTextField(
                   controller: healthcontroller,
                   maxLines: 10,
                 ),
               ),

                
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 10, 0, 20),
                  child: Container(
                  width: 330,
                  child: ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.pink[100])
                    ),
                    onPressed: () async {
                    int check;
                    // 내용 
                    Message.content = contentcontroller.text;
                    Message.workcontent = workcontroller.text;
                    print(contentcontroller.text);
                    // 물 
                    Message.count1 = count1;
                    Message.count2 = count2;
                    Message.count3 = count3;
                    Message.count4 = count4;
                    Message.count5 = count5;
                    Message.count6 = count6;
                    Message.count7 = count7;
                    Message.count8 = count8;
                    Message.waterAmount= waterAmount;
                    // 운동기록 
                    Message.health = healthcontroller.text;

                    Message.color1 =_color1;
                    Message.color2 =_color2;
                    Message.color3 =_color3;
                    Message.color4 =_color4;
                    Message.color5 =_color5;
                    Message.color6 =_color6;
                    Message.color7 =_color7;
                    Message.color8 =_color8;
                  
                    DBListService db = DBListService();
                    final diary = Diary (email: Message.email, formattedDate: Message.formattedDate, diarycontent: Message.content, workcontent: Message.workcontent, breakfast: Message.breakfast, lunch: Message.lunch, dinner: Message.dinner, waterAmount: Message.waterAmount, health: Message.health);
                    db.infoUpdate(diary,beforeDate);
                    check= await db.checkContent(Message.email, beforeDate);
                      if(check == 0){   
                        // 내용 
                      Message.content = "";
                      Message.workcontent = "";
                      // 물 
                      Message.count1 = 0;
                      Message.count2 = 0;
                      Message.count3 = 0;
                      Message.count4 = 0;
                      Message.count5 = 0;
                      Message.count6 = 0;
                      Message.count7 = 0;
                      Message.count8 = 0;
                      Message.waterAmount= 0;
                      // 운동기록 
                      Message.health = "";

                      Message.color1 =Colors.black87;
                      Message.color2 =Colors.black87;
                      Message.color3 =Colors.black87;
                      Message.color4 =Colors.black87;
                      Message.color5 =Colors.black87;
                      Message.color6 =Colors.black87;
                      Message.color7 =Colors.black87;
                      Message.color8 =Colors.black87;      
                      Navigator.pop(context);
                      Navigator.push(context, MaterialPageRoute(builder: (context){
                      return const TabNavigator();
                     }));          
                      
                    }
                    else{
                      _checkshowDialog(context);
                    }

                    }, 
                    child: const Text('수고했어, 오늘도',
                      style: TextStyle(
                        fontSize: 20,
                        fontFamily: 'GowunDodum',
                        fontWeight: FontWeight.bold,
                        letterSpacing: 12
                      ),
                    )
                  ),
              ),
                ),
                        
            ],
          ),
        ),
      ),
      
    );
  }

    Widget _buildTop() {
    
    return CarouselSlider(
      items: [
        
        Container(
          width: 250,
          height: 100,
          child: ElevatedButton(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(Colors.yellow[200])
          ),
            onPressed: (){
              _SaveshowDialog(context);
            }, 
            child: Column(
              children:  [
                const Padding(
                  padding: EdgeInsets.fromLTRB(0, 15, 0, 5),
                  child: Text('아침식단',
                  style: TextStyle(
                     color: Colors.black,
                     fontFamily: 'GowunDodum',
                     fontWeight: FontWeight.bold,
                     letterSpacing: 6,
                     fontSize: 16
                   ),
                  ),
                ),

                Container(
                  width:300,
                  child: const Divider(
                    thickness: 2,
                  ),
                ),
                Text("${Message.breakfast}",
                style: const TextStyle(
                     color: Colors.black,
                     fontFamily: 'GowunDodum'
                   ),)
              ],
            ),
            ),
          ),

          Container(
            width: 250,
            height: 100,
            child: ElevatedButton(
            style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(Colors.deepOrange[100])
            ),
            onPressed: (){
              _SaveshowDialog(context);
           }, 
           child: Column(
             children: [

               const Padding(
                 padding: EdgeInsets.fromLTRB(0, 15, 0, 5),
                 child: Text('점심식단',
                 style: TextStyle(
                     color: Colors.black,
                     fontFamily: 'GowunDodum',
                     fontWeight: FontWeight.bold,
                     letterSpacing: 6,
                     fontSize: 16
                   ),),
               ),
              Container(
                  width:300,
                  child: const Divider(
                    thickness: 2,
                  ),
                ),
                Text("${Message.lunch}",
                style: const TextStyle(
                     color: Colors.black,
                     fontFamily: 'GowunDodum',
                   ),
                )

             ],
           ),
            ),
          ),


          Container(
           width: 250,
           height: 100,
           child: ElevatedButton(
           style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Colors.lightBlue[100])
           ),
            onPressed: (){
               _SaveshowDialog(context);
            }, 
            child: Column(
              children:[
                const Padding(
                  padding:  EdgeInsets.fromLTRB(0, 15, 0, 5),
                  child:  Text('저녁식단',
                   style: TextStyle(
                     color: Colors.black,
                     fontFamily: 'GowunDodum',
                     fontWeight: FontWeight.bold,
                     letterSpacing: 6,
                     fontSize: 16
                   ),
                  ),
                ),
                 Container(
                  width:300,
                  child: const Divider(
                    thickness: 2,
                  ),
                ),
                Text("${Message.dinner}",
                style: const TextStyle(
                     color: Colors.black,
                     fontFamily: 'GowunDodum'
                   ),
                )

              ],
              
              
            ),
           
            ),
          ),
      ],
      options: CarouselOptions(
        height: 150,
        autoPlay: true,
      ),
    );
  }
 
  void showDatePickerPop() {
    Future<DateTime?> selectedDate = showDatePicker(
      context: context,
      initialDate: DateTime.now(), //초기값
      firstDate: DateTime(2022), //시작일
      lastDate: DateTime(2024), //마지막일
      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: ThemeData.dark(), //다크 테마
          child: child!,
        );
      },
    );

    selectedDate.then((dateTime) {
      
      setState(() {
        select = dateTime;
        formattedDate=DateFormat('yyyy년 MM월 dd일').format(select);  
        Message.formattedDate = formattedDate;
      });
      
      Fluttertoast.showToast(
        msg: dateTime.toString(), // 날짜 지정 값 
        toastLength: Toast.LENGTH_LONG,
      );
    });
  }



   _SaveshowDialog(BuildContext context){
    showDialog(
      context: context, 
      builder: (BuildContext context){
          return AlertDialog(
            title: const Text('중간저장',
              style: TextStyle(
                fontFamily: 'GowunDodum',
              ),
            ),
            content: const Text('지금까지 쓴 내용을 저장하시겠습니까?.',
              style: TextStyle(fontFamily: 'GowunDodum',),
            ),
            actions:[
              TextButton(
                onPressed: (){
                  
                  Message.formattedDate = beforeDate;
                  print(formattedDate);
                 // 내용 
                  Message.content = contentcontroller.text;
                  Message.workcontent = workcontroller.text;
                  print(contentcontroller.text);
                  // 물 
                  Message.count1 = count1;
                  Message.count2 = count2;
                  Message.count3 = count3;
                  Message.count4 = count4;
                  Message.count5 = count5;
                  Message.count6 = count6;
                  Message.count7 = count7;
                  Message.count8 = count8;
                  Message.waterAmount= waterAmount;
                  // 운동기록 
                  Message.health = healthcontroller.text;

                  Message.color1 =_color1;
                  Message.color2 =_color2;
                  Message.color3 =_color3;
                  Message.color4 =_color4;
                  Message.color5 =_color5;
                  Message.color6 =_color6;
                  Message.color7 =_color7;
                  Message.color8 =_color8;
                  
                  Navigator.push(context, MaterialPageRoute(builder: (context){
                  return const FoodEdit();
                  }));
                },
                child: const Text('저장',
                  style: TextStyle(
                    fontFamily: 'GowunDodum',
                    fontSize: 18
                  ),
                ),
              ),
            ],
          );
        }
      );
  }

  _checkshowDialog(BuildContext context){
    showDialog(
      context: context, 
      builder: (BuildContext context){
          return AlertDialog(
            content: const Text('다이어리 내용이 중복 되었습니다. \n 다이어리를 확인해주세요!',
              style: TextStyle(
                fontFamily: 'GowunDodum',
              ),
            ),
            actions:[
              TextButton(
                onPressed: (){
                  Navigator.of(context).pop();
                  Navigator.push(context, MaterialPageRoute(builder: (context){
                  return const ModifyPage();
                  }));
                },
                child: const Text('확인',
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