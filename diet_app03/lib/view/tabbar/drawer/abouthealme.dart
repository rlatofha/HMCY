import 'package:flutter/material.dart';

class AboutHealme extends StatefulWidget {
  const AboutHealme({ Key? key }) : super(key: key);

  @override
  _AboutHealmeState createState() => _AboutHealmeState();
}

class _AboutHealmeState extends State<AboutHealme> {
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
            crossAxisAlignment: CrossAxisAlignment.start,
            children:  [
        
              const Padding(
                padding:  EdgeInsets.fromLTRB(60, 20, 0, 40),
                child:  Text('힐Me,치You"',
                  style: TextStyle(
                    fontSize: 50,
                    fontFamily: 'GowunDodum',
                  ),
                ),
              ),
        
              Container(
                width: 350,
                child: const Divider(
                  thickness: 1,
                ),
              ),
        
              const Padding(
                padding: EdgeInsets.fromLTRB(0, 20, 0, 20),
                child: Text("Heal: 치료하다.",
                  style: TextStyle(
                    fontSize: 25,
                    fontFamily: 'GowunDodum',
                  ),
                ),
              ),
              
              Container(
                width: 300,
                child: const Text('이유없이 낙담하게 될 때,\n내가 나의 마음을 알고\n나 자신을 위로하게 되길 바라요.',
                    style: TextStyle(
                    fontSize: 22,
                    fontFamily: 'GowunDodum',
                  ),
                ),
              ),
        
        
              // 속담 박스 
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 0, 0, 20),
                child: Container(
                  width: 350,
                  decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.greenAccent[700],
                  ),
                  child: Row(
                    children: [
                      Column(
                        children:  [
                          const Padding(
                            padding:  EdgeInsets.fromLTRB(0, 5, 0, 0),
                            child:  Text('아무도 당신을 믿지 않을 때도\n자기자신을 믿는 것,\n그것이 챔피언이 되는 길이다.',
                              style: TextStyle(
                                fontSize: 23,
                                color: Colors.white,
                                fontFamily: 'GowunDodum'
                              ),
                            ),
                          ),
        
                         
                          Row(
                            children: [
                              Column(
                                //crossAxisAlignment: CrossAxisAlignment.end,
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: const  [
                                  Padding(
                                    padding: EdgeInsets.fromLTRB(80, 10, 10, 5),
                                    child: Text('슈거 레이 로빈슨\n(1921~1989, 미 프로복서)',
                                      style: TextStyle(
                                          fontSize: 23,
                                          color: Colors.white,
                                          fontFamily: 'GowunDodum'
                                        ),
                                      ),
                                  ),
                                ],
        
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              
        
        
          
           
        
        
        
            ],
          ),
        ),
      ),
    );
  }
}