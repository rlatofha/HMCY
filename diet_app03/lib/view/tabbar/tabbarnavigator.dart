import 'package:diet_app/message/message.dart';
import 'package:diet_app/service/dbservice.dart';
import 'package:diet_app/view/login/login.dart';
import 'package:diet_app/view/tabbar/drawer/abouthealme.dart';
import 'package:diet_app/view/tabbar/drink/drink.dart';
import 'package:diet_app/view/tabbar/selectpage.dart';
import 'package:diet_app/view/tabbar/home/homepage.dart';
import 'package:diet_app/view/tabbar/list/listpage.dart';
import 'package:flutter/material.dart';

class TabNavigator extends StatefulWidget {
  const TabNavigator({ Key? key }) : super(key: key);

  @override
  _TabNavigatorState createState() => _TabNavigatorState();
}

class _TabNavigatorState extends State<TabNavigator> {
  var _index = 0;
  var _pages = [
    HomePage(),
    Water(),
    ListPage(),
  ];
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

       drawer: Drawer(        
        child: ListView(
          
          children: [
             UserAccountsDrawerHeader(
              currentAccountPicture: const Padding(
                padding: EdgeInsets.all(8.0),
                child: CircleAvatar(
                  backgroundImage: AssetImage('images/draweruser.png'),
                  radius: 120,
                ),
              ),
              accountName: Text('${Message.nickname}',
               style: const TextStyle(
                 fontSize: 20,
                 fontWeight: FontWeight.bold
               ),
              ), 
              accountEmail: Text('${Message.email}'),
              decoration: const BoxDecoration(
                color: Colors.lightGreen,
                borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(40.0),
                ),
              ),
            ),
           
            // Home
            ListTile(
              leading:  const Icon(
                Icons.home,
                color: Colors.black,
              ),
              title: const Text('Home'),
              onTap:(){
                Navigator.push(context, MaterialPageRoute(builder: (context){
                return const TabNavigator();
                }));
              },
            ),
            // About 힐미 
             ListTile(
              leading:  const Icon(
                Icons.contact_support,
                color: Colors.black,
              ),
              title: const Text('About 힐미'),
              onTap:(){
                Navigator.push(context, MaterialPageRoute(builder: (context){
                return const AboutHealme();
                }));
              },
            ),
  
            ListTile(
              leading:  const Icon(
                Icons.logout_outlined,
                color: Colors.black,
              ),
              title: const Text('로그아웃'),
              onTap:(){
                _logoutshowDialog(context);
              },
            ),

    
          ],
        ),
      ),

      body: _pages[_index],
      bottomNavigationBar: BottomNavigationBar(
        onTap: (value) {
          setState(() {
            _index = value;
          });
        },
        items: const <BottomNavigationBarItem>[

          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
            ),
            label: 'Home',
            backgroundColor: Colors.blueGrey,
          ),

          BottomNavigationBarItem(
            icon: Icon(
              Icons.opacity,
            ),
            label: 'Water',
            backgroundColor: Colors.blueGrey,
          ),

          BottomNavigationBarItem(
            icon: Icon(
              Icons.list_outlined,
            ),
             label: 'List',
            backgroundColor: Colors.blueGrey,
          ),
          
        ],
        currentIndex: _index,
      ),
    );
  }

  // 로그아웃
  _logoutshowDialog(BuildContext context){
    showDialog(
      context: context, 
      builder: (BuildContext context){
          return AlertDialog(
            title: const Text('로그아웃'),
            content: const Text('로그아웃 하시겠습니까?'),
            actions:[
              TextButton(
                onPressed: (){
                  DBservice db = DBservice();
                  db.logout(Message.email);
                  Navigator.of(context).pop();
                  Navigator.push(context, MaterialPageRoute(builder: (context){
                  return const Login();
                  }));
                },
                child: const Text('확인'),
              ),
            ],
          );
        }
      );
  }


  // 회원탈퇴
  _showDialog(BuildContext context){
    showDialog(
      context: context, 
      builder: (BuildContext context){
          return AlertDialog(
            title: const Text('회원탈퇴'),
            content: const Text('회원탈퇴 하시겠습니까?'),
            actions:[
              TextButton(
                onPressed: (){
                  Navigator.of(context).pop();
                  Navigator.push(context, MaterialPageRoute(builder: (context){
                  return const Login();
                  }));
                },
                child: const Text('확인'),
              ),
            ],
          );
        }
      );
  }


}
