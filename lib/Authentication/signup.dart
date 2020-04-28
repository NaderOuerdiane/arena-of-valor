import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:arenaofvalor/Authentication/signin.dart';
import 'package:arenaofvalor/Services/AuthService.dart';
import 'package:arenaofvalor/home/home.dart';

import '../loading.dart';

class signUp extends StatefulWidget {
  @override
  _signUpState createState() => _signUpState();
}

class _signUpState extends State<signUp> {
  String _email;
  String _password;
  final _formKey = GlobalKey<FormState>();
  String _passwordConfirm;
  bool _loading = false;

  Widget _emailForm(height) {
    return Container(
      margin: EdgeInsets.only(bottom: height * 0.01),
      child: TextFormField(
        keyboardType: TextInputType.emailAddress,
        style: TextStyle(
            fontFamily: "FireCode", fontSize: 22, color: Colors.white),
        cursorWidth: 2,
        cursorRadius: Radius.circular(2),
        cursorColor: Colors.yellow[900],
        maxLength: 40,
        maxLines: 1,
        decoration: InputDecoration(
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(color: Colors.white, width: 2)),
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(color: Colors.white)),
            counterText: '',
            hintText: 'email',
            hintStyle: TextStyle(
                fontFamily: "FireCode",
                color: Colors.grey[400],
                fontSize: 22,
                letterSpacing: 3)),
        validator: (value) {
          if (value.isEmpty)
            return 'email is empty';
          else if (!RegExp(
                  r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
              .hasMatch(value))
            return 'email not valid';
          else
            return null;
        },
        onSaved: (value) => _email = value,
      ),
    );
  }

  Widget _passwordForm(height) {
    return Container(
      margin: EdgeInsets.only(bottom: height * 0.01),
      child: TextFormField(
        style: TextStyle(
            fontFamily: "FireCode", fontSize: 22, color: Colors.white),
        cursorWidth: 2,
        cursorRadius: Radius.circular(2),
        cursorColor: Colors.yellow[900],
        maxLength: 30,
        obscureText: true,
        decoration: InputDecoration(
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(color: Colors.white, width: 2)),
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(color: Colors.white)),
            counterText: '',
            hintText: 'Password',
            hintStyle: TextStyle(
                fontFamily: "FireCode",
                fontSize: 22,
                color: Colors.grey[400],
                letterSpacing: 3)),
        validator: (value) {
          _password = value;
          if (value.length < 6) {
            return 'Password is too short';
          } else {
            return null;
          }
        },
        onSaved: (value) => _password = value,
      ),
    );
  }

  Widget _passwordConfirmForm(height) {
    return Container(
      margin: EdgeInsets.only(bottom: height * 0.01),
      child: TextFormField(
        style: TextStyle(
            fontFamily: "FireCode", fontSize: 22, color: Colors.white),
        cursorWidth: 2,
        cursorRadius: Radius.circular(2),
        cursorColor: Colors.yellow[900],
        maxLength: 30,
        obscureText: true,
        decoration: InputDecoration(
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(color: Colors.white, width: 2)),
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(color: Colors.white)),
            counterText: '',
            hintText: 'Confirm Password',
            hintStyle: TextStyle(
                fontFamily: "FireCode",
                fontSize: 22,
                color: Colors.grey[400],
                letterSpacing: 3)),
        validator: (value) =>
            value != _password ? "Password doesn't match" : null,
        onSaved: (value) => _passwordConfirm = value,
      ),
    );
  }

  Future<dynamic> signup(AuthService _auth) async {
    try {
      dynamic result = await _auth.signUp(_email, _password);
      return result;
    } catch (e) {
      print(e + 'ERROR');
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return _loading
        ? loading()
        : Scaffold(
            body: GestureDetector(
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(colors: <Color>[
                    Color.fromRGBO(29, 33, 54, 1),
                    Color.fromRGBO(29, 33, 54, 0.95),
                  ]),
                ),
                child: SafeArea(
                  child: Container(
                    margin: EdgeInsets.only(
                        right: width * 0.05, left: width * 0.05),
                    child: Form(
                      key: _formKey,
                      child: ListView(
                          physics: NeverScrollableScrollPhysics(),
                          children: <Widget>[
                            Container(
                              margin: EdgeInsets.only(
                                  top: height * 0.1, bottom: height * 0.145),
                              alignment: Alignment.center,
                              child: Text(
                                'Create a new account',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                    fontFamily: "FireCode",
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            _emailForm(height),
                            _passwordForm(height),
                            _passwordConfirmForm(height),
                            Container(
                              margin: EdgeInsets.only(top: height * 0.01), //10
                              child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: <Widget>[
                                    Text(
                                      "Already have an account?  ",
                                      style: TextStyle(
                                          fontFamily: 'FireCode',
                                          fontSize: 14,
                                          color: Colors.grey[400]), //14
                                    ),
                                    GestureDetector(
                                        onTap: () {
                                          Navigator.pushReplacement(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) => signIn()),
                                          );
                                        },
                                        child: Text('LOGIN',
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontFamily: 'FireCode',
                                                fontSize: 16,
                                                fontWeight:
                                                    FontWeight.bold))), //16
                                  ]),
                            ),
                            GestureDetector(
                              onTap: () async {
                                if (!_formKey.currentState.validate()) {
                                  return;
                                }
                                _formKey.currentState.save();

                                setState(() {
                                  _loading = true;
                                });

                                final AuthService _auth = AuthService();
                                
                                
                                if (await signup(_auth) == null) {
                                  Fluttertoast.showToast(
                                      msg:
                                          "There has been a problem signing up",
                                      toastLength: Toast.LENGTH_SHORT,
                                      timeInSecForIos: 1,
                                      backgroundColor: Colors.grey,
                                      textColor: Colors.white,
                                      fontSize: 16.0);

                                  setState(() {
                                    _loading = false;
                                  });
                                } else {
                                  Fluttertoast.showToast(
                                      msg: "Sign up Successful",
                                      toastLength: Toast.LENGTH_SHORT,
                                      timeInSecForIos: 1,
                                      backgroundColor: Colors.grey,
                                      textColor: Colors.white,
                                      fontSize: 16.0);

                                  Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => home()));
                                }
                              },
                              child: Container(
                                margin: EdgeInsets.fromLTRB(
                                    width * 0.2, height * 0.1, width * 0.2, 0),
                                padding: EdgeInsets.symmetric(
                                    vertical: height * 0.03),
                                decoration: BoxDecoration(
                                    gradient: LinearGradient(colors: <Color>[
                                      Color.fromRGBO(50, 50, 68, 1),
                                      Color.fromRGBO(50, 50, 68, 1)
                                          .withOpacity(0.8),
                                    ]),
                                    color: Colors.blue,
                                    border: Border.all(
                                        color: Colors.white, width: 1),
                                    borderRadius: BorderRadius.circular(10)),
                                alignment: Alignment.center,
                                child: Text(
                                  'Register',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontFamily: 'FireCode',
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20),
                                ),
                              ),
                            )
                          ]),
                    ),
                  ),
                ),
              ),
            ),
          );
  }
}
