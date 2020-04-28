import 'package:arenaofvalor/Authentication/signin.dart';
import 'package:arenaofvalor/Authentication/signup.dart';
import 'package:flutter/material.dart';
import 'package:arenaofvalor/Services/AuthService.dart';
import 'credits.dart';
import 'input.dart';
import 'output.dart';
import 'package:arenaofvalor/Wrapper.dart';

class authhome extends StatefulWidget {
  @override
  _authhomeState createState() => _authhomeState();
}

class _authhomeState extends State<authhome> {
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
                    flex: 5,
                    child: Image.asset(
                      'assets/images/Logo.png',
                      fit: BoxFit.fitWidth,
                    ),
                  ),
                  Expanded(
                    flex: 5,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        Expanded(
                          child: InkWell(
                            onTap: () async {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => signIn()));
                            },
                            child: Container(
                                margin: EdgeInsets.fromLTRB(width * 0.2,
                                    height * 0.1, width * 0.2, width * 0.025),
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
                                  'log in',
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
                                      builder: (context) => signUp()));
                            },
                            child: Container(
                                margin: EdgeInsets.fromLTRB(width * 0.2,
                                    height * 0.011, width * 0.2, height * 0.1),
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
                                  'sign up',
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
                  /*Expanded(
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => creditsPage()));
                      },
                      child: Container(
                          margin: EdgeInsets.only(bottom: height * 0.025),
                          child: Icon(
                            Icons.copyright,
                            color: Colors.white,
                          )),
                    ),
                  ),*/
                ],
              ),
            )),
      ),
    );
  }
}
