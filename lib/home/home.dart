import 'package:flutter/material.dart';
import 'package:arenaofvalor/Services/AuthService.dart';
import 'credits.dart';
import 'input.dart';
import 'output.dart';
import 'package:arenaofvalor/Wrapper.dart';

class home extends StatefulWidget {
  @override
  _homeState createState() => _homeState();
}

class _homeState extends State<home> {
  double height;
  double width;
  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: WillPopScope(
        onWillPop: () async => false,
        child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(colors: <Color>[
                Color.fromRGBO(29, 33, 54, 1),
                Color.fromRGBO(29, 33, 54, 0.95),
              ]),
            ),
            child: SafeArea(
              child: Column(
                children: <Widget>[
                  Expanded(
                    flex: 4,
                    child: Image.asset(
                      'assets/images/Logo.png',
                      fit: BoxFit.fitWidth,
                    ),
                  ),
                  Expanded(
                    flex: 4,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        Expanded(
                          child: InkWell(
                            onTap: () async {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => inputPage()));
                            },
                            child: Container(
                                margin: EdgeInsets.fromLTRB(width * 0.2,
                                    height * 0.05, width * 0.2, width * 0.025),
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  boxShadow: <BoxShadow>[
                                    BoxShadow(
                                        color: Colors.white.withOpacity(0.2),
                                        blurRadius: 20,
                                        spreadRadius: 5)
                                  ],
                                  borderRadius: BorderRadius.circular(10),
                                  color: Color.fromRGBO(50, 50, 68, 1),
                                ),
                                child: Text(
                                  'Match Results',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize: 24,
                                      fontFamily: 'FireCode',
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                )),
                          ),
                        ),
                        Expanded(
                          child: InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => outputPage()));
                            },
                            child: Container(
                                margin: EdgeInsets.fromLTRB(width * 0.2,
                                    height * 0.011, width * 0.2, height * 0.05),
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  boxShadow: <BoxShadow>[
                                    BoxShadow(
                                        color: Colors.white.withOpacity(0.2),
                                        blurRadius: 20,
                                        spreadRadius: 5)
                                  ],
                                  borderRadius: BorderRadius.circular(10),
                                  color: Color.fromRGBO(50, 50, 68, 1),
                                ),
                                child: Text(
                                  'Statistics',
                                  style: TextStyle(
                                      fontSize: 24,
                                      fontFamily: 'FireCode',
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                )),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: GestureDetector(
                      onTap: () async {
                        await AuthService().signOut();
                        Navigator.pushReplacement(context,
                            MaterialPageRoute(builder: (context) => Wrapper()));
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          boxShadow: <BoxShadow>[
                            BoxShadow(
                                color: Color.fromRGBO(253, 73, 103, 1)
                                    .withOpacity(0.7),
                                blurRadius: 20,
                                spreadRadius: 5)
                          ],
                          borderRadius: BorderRadius.circular(10),
                          gradient: LinearGradient(colors: <Color>[
                            Color.fromRGBO(233, 73, 103, 1),
                            Color.fromRGBO(233, 73, 103, 1).withOpacity(0.9)
                          ]),
                        ),
                        padding: EdgeInsets.all(height * 0.025),
                        alignment: Alignment.center,
                        margin: EdgeInsets.fromLTRB(
                            width * 0.2, 0 , width * 0.2, height * 0.085),
                        child: Text(
                          'Sign Out',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'FireCode',
                              fontSize: 20),
                        ),
                      ),
                    ),
                  ),
                  /*Expanded(
                                      child: GestureDetector(
                      onTap: (){
                        Navigator.push(context,MaterialPageRoute(builder: (context) => creditsPage()));
                      },
                      child: Container(
                          margin: EdgeInsets.only(bottom: height * 0.025),
                          child: Icon(Icons.copyright,color: Colors.white,)),
                    ),
                  ),*/
                ],
              ),
            )),
      ),
    );
  }
}
