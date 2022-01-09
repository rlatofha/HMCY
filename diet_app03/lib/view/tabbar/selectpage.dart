import 'package:diet_app/message/message.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
class SelectPage extends StatefulWidget {
  const SelectPage({ Key? key }) : super(key: key);

  @override
  _SelectPageState createState() => _SelectPageState();
}

class _SelectPageState extends State<SelectPage> {
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
            children:  [
               Padding(
                 padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                 child: Container(
                    width: 350,
                    height: 50,
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
                      //crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
                          child: Text("${Message.formattedDate}",
                            style: const TextStyle(
                              fontSize: 20, 
                              fontWeight: FontWeight.bold,
                              fontFamily: 'GowunDodum',
                            ),   
                          ),
                        ),
                      ],
                    ),
                  ),
               ),
              Container(
                width: 350,
                height: 200,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                    color: Colors.black,
                    style: BorderStyle.solid,
                    width: 1
                )
              ),
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                  child: Text('${Message.content}',
                    style: const TextStyle(
                      fontSize: 18, 
                      fontFamily: 'GowunDodum',
                    ),   
                  ),
                )
              ), 
        
               Padding(
                 padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                 child: Container(
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
                      padding:  EdgeInsets.fromLTRB(20, 10, 0, 0),
                      child:  Text("오늘의 감사한 일",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'GowunDodum',
                        ),
                      ),
                    ),
                  ),
               ),
        
        
                //오늘의 감사한 일 내용 
                 Padding(
                   padding: const EdgeInsets.fromLTRB(0, 0, 0, 20),
                   child: Container(
                width: 350,
                height: 200,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color: Colors.black,
                      style: BorderStyle.solid,
                      width: 1
                )
              ),
                child: Padding(
                    padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                    child: Text('${Message.workcontent}',
                      style: const TextStyle(
                          fontSize: 18, 
                          fontFamily: 'GowunDodum',
                        ),  
                    ),
                )
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
        
                 // 물 마시기 내용 
                 Container(
                width: 350,
                height: 80,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                    color: Colors.black,
                    style: BorderStyle.solid,
                    width: 1
                )
              ),
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(20, 25, 0, 10),
                  child: Text('${Message.waterAmount*250/1000}L',
                  style: const TextStyle(
                      fontSize: 18, 
                      fontFamily: 'GowunDodum',
                    ),  
                  ),
                )
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
                 Padding(
                   padding: const EdgeInsets.only(bottom: 20),
                   child: Container(
                width: 350,
                height: 80,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color: Colors.black,
                      style: BorderStyle.solid,
                      width: 1
                )
              ),
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                  child: Text('${Message.health}',
                      style: const TextStyle(
                        fontSize: 15, 
                        fontFamily: 'GowunDodum',
                      ),  
                  ),
                )
              ),
                 ),
            ]
          ),
        )
      )
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
              //_SaveshowDialog(context);
            }, 
            child: Column(
              children:  [
                const Padding(
                  padding: EdgeInsets.fromLTRB(0, 15, 0, 5),
                  child: Text('아침식단',
                  style: TextStyle(
                     color: Colors.black,
                     fontFamily: 'GowunDodum',
                     letterSpacing: 6,
                     fontSize: 16,
                     fontWeight: FontWeight.bold
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
                     fontFamily: 'GowunDodum',
                     letterSpacing: 6,
                     fontSize: 16,
                     fontWeight: FontWeight.bold
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
              //_SaveshowDialog(context);
           }, 
           child: Column(
             children: [

               const Padding(
                 padding: EdgeInsets.fromLTRB(0, 15, 0, 5),
                 child: Text('점심식단',
                 style: TextStyle(
                     color: Colors.black,
                     fontFamily: 'GowunDodum',
                     letterSpacing: 6,
                     fontSize: 16,
                     fontWeight: FontWeight.bold
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
               //_SaveshowDialog(context);
            }, 
            child: Column(
              children:[
                const Padding(
                  padding:  EdgeInsets.fromLTRB(0, 15, 0, 5),
                  child:  Text('저녁식단',
                   style: TextStyle(
                     color: Colors.black,
                     fontFamily: 'GowunDodum',
                     letterSpacing: 6,
                     fontSize: 16,
                     fontWeight: FontWeight.bold
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
                     fontFamily: 'GowunDodum',
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
}
             
