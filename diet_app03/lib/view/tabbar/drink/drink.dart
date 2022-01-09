import 'dart:ffi';

import 'package:diet_app/view/tabbar/tabbarnavigator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Water extends StatefulWidget {
  const Water({ Key? key }) : super(key: key);

  @override
  _WaterState createState() => _WaterState();
}

class _WaterState extends State<Water> {
  TextEditingController heightcontroller = TextEditingController();
  TextEditingController weightcontroller = TextEditingController();
  late  double result;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    result = 0;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
               Padding(
                 padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                 child: Image.asset('images/water.png',
                  
                    fit: BoxFit.contain,
                    height: 300,
                    width: 300,
                    
                  ),
               ),
      
              Padding(
                padding: const EdgeInsets.fromLTRB(40, 30, 0, 30),
                child: Container(
                  width: 250,
                  child: const Text('자신에게 맞는\n하루 물 섭취 권장량을 계산해보세요!',
                    style: TextStyle(
                      fontFamily: 'GowunDodum',
                    ),
                  )
                ),
              ),
      
      
               Container(
                  width: 300,
                  child: TextField(
                    controller: heightcontroller,
                    decoration: const InputDecoration(
                      prefixIcon: Icon(Icons.accessibility_outlined),
                      label: Text('신장(cm)',
                        style: TextStyle(
                          // fontFamily: 'GowunDodum',
                        ),
                      ),
                      hintText: '000cm',
                      border: OutlineInputBorder(),
                    ),
                    keyboardType: TextInputType.number,
                  ),
                ),
                
                Container(
                  width: 300,
                  child: TextField(
                    controller: weightcontroller,
                    decoration: const InputDecoration(
                      prefixIcon: Icon(Icons.account_balance_outlined),
                      label: Text('체중(kg'),
                      hintText: '00kg',
                      border: OutlineInputBorder(),
                    ),
                    keyboardType: TextInputType.number,
                    
                  ),
                ),
      
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 30, 0, 0),
                  child: Container(
                    width: 300,
                    height: 50,
                    child: ElevatedButton(
                      style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.lightBlue)),
                      onPressed: (){  
                        result = ((int.parse(heightcontroller.text) + int.parse(weightcontroller.text)) / 100) ;
                        _showDialog(context);
                      }, 
                      child: const Text('권장량 측정',
                        style: TextStyle(
                          fontFamily: 'GowunDodum',
                          fontSize: 20,
                          letterSpacing: 5
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
    // 로그인 완료
  _showDialog(BuildContext context){
    showDialog(
      context: context, 
      builder: (BuildContext context){
          return AlertDialog(
            title: const Text('물의 섭취결과',
              style: TextStyle(
                fontFamily: 'GowunDodum',
              ),
            ),
            content: Text('회원님의 하루 물 섭취량은 ${result}L 입니다.',
              style: const TextStyle(
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
            ],
          );
        }
      );
  }
}