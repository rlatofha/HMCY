import 'package:diet_app/model/user.dart';
import 'package:diet_app/service/dbservice.dart';
import 'package:diet_app/view/login/login.dart';
import 'package:flutter/material.dart';

class Register extends StatefulWidget {
  const Register({ Key? key }) : super(key: key);

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  
  TextEditingController idcontroller = TextEditingController();
  TextEditingController pwcontroller = TextEditingController();
  TextEditingController nicknamecontroller = TextEditingController();
  String email = "";
  String password = "";
  

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
        body: SingleChildScrollView(
          child: Column(
            children:  [

               Padding(
                 padding: const EdgeInsets.fromLTRB(80, 60, 40, 30),
                 child: Container(
                   width: 260,
                   height: 100,
                   child: const Text('간편한 회원가입을 통해\n힐Me,치You와 함께하세요.',
                     style: TextStyle(
                       fontSize: 23,
                       fontFamily: 'GowunDodum'
                     ),
                   ),
                 ),
               ),
        
              const Padding(
                padding: EdgeInsets.fromLTRB(60, 0, 200, 10),
                child: Text('기본정보 입력',
                  style: TextStyle(
                    fontSize: 20,
                    fontFamily: 'GowunDodum'
                  ),
                ),
              ),
        
              // Email 입력값 
              Padding(
                padding: const EdgeInsets.fromLTRB(40, 0, 0, 0),
                child: Container(
                  width: 300,
                  child: TextField(
                    controller: idcontroller,
                    decoration: const InputDecoration(
                      prefixIcon: Icon(Icons.mail_outline),
                      label: Text('Email'),
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
              ),
        
              // Password 입력값 
              Padding(
                padding: const EdgeInsets.fromLTRB(40, 0, 0, 0),
                child: Container(
                  width: 300,
                  child: TextField(
                    controller: pwcontroller,
                    decoration: const InputDecoration(
                      prefixIcon: Icon(Icons.vpn_key_outlined),
                      label: Text('Password'),
                      border: OutlineInputBorder(),
                    ),
                    obscureText: true,
                  ),
                ),
              ),
        
               // nickname 입력값 
              Padding(
                padding: const EdgeInsets.fromLTRB(40, 0, 0, 60),
                child: Container(
                  width: 300,
                  child: TextField(
                    controller: nicknamecontroller,
                    decoration: const InputDecoration(
                      prefixIcon: Icon(Icons.badge_outlined),
                      label: Text('nickname'),
                      border: OutlineInputBorder(),
                    ),
                    //obscureText: true,
                  ),
                ),
              ),
        
              
        
              // Register
              Container(
                width: 300,
                height: 70,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(60, 0, 20, 10),
                  child: ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.teal[900])
                    ),
                  
                  onPressed: () async {
                    int result;
                    DBservice db = DBservice();
                    result = await db.checkContent(idcontroller.text);
                    if(result == 0){
                      final user = User (email: idcontroller.text, password: pwcontroller.text, nickname: nicknamecontroller.text);
                      db.insertUser(user);
                       _showDialog(context);
                    }else{
                      errorSnackBar(context);
                    }
        
                  },
                  child: const Text('회원가입하기',
                     style: TextStyle(
                       fontSize: 20,
                       fontFamily: 'GowunDodum',
                       letterSpacing: 5
                     ),
                    )
                  ),
                ),
              ),
            ],
          ),
        ),
    );
  }
  _showDialog(BuildContext context){
    showDialog(
      context: context, 
      builder: (BuildContext context){
          return AlertDialog(
            title: const Text('회원가입',
              style: TextStyle(
                fontFamily: 'GowunDodum'
              ),
            ),
            content: const Text('회원가입이 완료되었습니다.',
              style: TextStyle(
                fontFamily: 'GowunDodum'
              ),
            ),
            actions:[
              TextButton(
                onPressed: (){
                  Navigator.of(context).pop();
                  Navigator.push(context, MaterialPageRoute(builder: (context){
                  return const Login();
                  }));

                },
                child: const Text('확인',
                  style: TextStyle(
                    fontFamily: 'GowunDodum'
                  ),
                ),
              ),
            ],
          );
        }
      );


  }

  errorSnackBar(BuildContext context){
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('사용자 정보 입력에 문제가 발생 하였습니다.',
          style: TextStyle(
            fontFamily: 'GowunDodum'
          ),
        ),
        duration: Duration(seconds: 3),
        backgroundColor: Colors.red,
      ),
    );
  }
}
