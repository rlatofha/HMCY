import 'package:diet_app/service/dbservice.dart';
import 'package:diet_app/view/login/register.dart';
import 'package:diet_app/view/tabbar/tabbarnavigator.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login({ Key? key }) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController idcontroller = TextEditingController();
  TextEditingController pwcontroller = TextEditingController();
  TextEditingController searchcontroller = TextEditingController();

  String email = "";
  String password = "";
  var result;
  @override
  Widget build(BuildContext context) {
   return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Column(         
            children:  [        
             Padding(
               padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
               child: Image.asset('images/bigLogo.png',
                  fit: BoxFit.contain,
                  height: 150,
                  width: 300,
                  
                ),
             ),
        
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children:[
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
        
                    Container(
                      width: 340,
                      child: const Padding(
                        padding:  EdgeInsets.fromLTRB(65, 20, 50, 0),
                        child:  Text('힐Me,치You에 로그인하여\n오늘을 기록하세요.',
                          style: TextStyle(
                            fontSize: 20,
                            fontFamily: 'GowunDodum'
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ]
            ),
        
            const Padding(
              padding: const EdgeInsets.all(30.0),
              child: Divider(
                thickness: 2,
              ),
            ),
        
        
              Container(
                width: 300,
                child: TextField(
                  controller: idcontroller,
                  decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.mail_outline),
                    label: Text('Email',
                      style: TextStyle(
                        fontFamily: 'GowunDodum'
                      ),
                    ),
                    hintText: '00000@example.com',
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              Container(
                width: 300,
                child: TextField(
                  controller: pwcontroller,
                  decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.vpn_key_outlined),
                    label: Text('Password',
                      style: TextStyle(
                        fontFamily: 'GowunDodum'
                      ),
                    ),
                    border: OutlineInputBorder(),
                  ),
                  obscureText: true,
                ),
              ),
              
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Container(
                      width: 300,
                      child: ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(Colors.grey[400])
                        ),
                        onPressed: () async {
                          var count;
                          DBservice db = DBservice();
                          count = await db.getlogin(idcontroller.text, pwcontroller.text);
        
                          if(count == 0){
                            errorSnackBar(context);
                          }else{
                            _showDialog(context);
                          }
                        },
                        child: const Text('로그인',
                          style: TextStyle(
                            fontSize: 18,
                            fontFamily: 'GowunDodum',
                            letterSpacing: 12
                          ),
                        )
                      ),
                    ),
                  ),
            
        
              Padding(
                padding: const EdgeInsets.fromLTRB(80, 0, 0, 0),
                child: Container(
                  width: 300,
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 10, 10, 10),
                        child: TextButton(
                          onPressed: (){
                            pwseachshowDialog(context);
                            
                          },
                          child: const Text('비밀번호 찾기',
                            style: TextStyle(
                              //fontStyle: FontStyle.italic,
                              color: Colors.black,
                              fontFamily: 'GowunDodum'
                            ),
                          
                          )
                        ),
                      ),

                      Container(
                        height: 40,
                        child: const VerticalDivider(
                          thickness: 2,
                        ),
                      ),
        
                    Padding(
                      padding: const EdgeInsets.fromLTRB(10, 10, 20, 10),
                      child: TextButton(
                        onPressed: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context){
                            return const Register();
                          }));
                        },
                        child: const Text('회원가입',
                          style: TextStyle(
                              color: Colors.black,
                              fontFamily: 'GowunDodum',
                              letterSpacing: 5
                            ),
                        )
                      ),
                    ),
                  ],
                ),
            ),
              )
        
        
        
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
            title: const Text('로그인',
              style: TextStyle(
                fontFamily: 'GowunDodum'
              ),
            ),
            content: const Text('로그인이 완료되었습니다.',
              style: TextStyle(
                fontFamily: 'GowunDodum'
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
        duration: Duration(seconds: 2),
        backgroundColor: Colors.red,
      ),
    );
  }
  
  // 비밀번호 찾기 Dialog 
  pwseachshowDialog(BuildContext context){
    showDialog(
      context: context, 
      builder: (BuildContext context){
        return AlertDialog(
          title: const Text('비밀번호 찾기',
            style: TextStyle(
              fontFamily: 'GowunDodum'
            ),
          ),
          content: TextField(
            controller: searchcontroller,
            decoration: const InputDecoration(
                labelText:'아이디 입력',
                border: OutlineInputBorder(),
            ),
            keyboardType: TextInputType.text
          ),
          actions:[
              ElevatedButton(
                onPressed: () async {
                  Navigator.of(context).pop();
                  DBservice db = DBservice();
                  result = await db.getPassword(searchcontroller.text.toString());
                  print(result);
                  if(result == "null"){
                    _emailerrorshowDialog(context);
                  }else{
                    _pwshowDialog(context);
                  }
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

    // 비밀번호 알려줌 
  _pwshowDialog(BuildContext context){
    showDialog(
      context: context, 
      builder: (BuildContext context){
          return AlertDialog(
            content: Text('회원님의 비밀번호는 "${result}" 입니다.',
              style: const TextStyle(
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

   // 비밀번호 알려줌 
  _emailerrorshowDialog(BuildContext context){
    showDialog(
      context: context, 
      builder: (BuildContext context){
          return AlertDialog(
            content: const Text('회원님의 E-mail을 확인해주세요.',
              style: TextStyle(
                fontFamily: 'GowunDodum'
              ),
            ),
            actions:[
              TextButton(
                onPressed: (){
                  pwseachshowDialog(context);
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
  
  
  






}

