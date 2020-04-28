import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:arenaofvalor/Authentication/signup.dart';
import 'package:arenaofvalor/Services/AuthService.dart';
import 'package:arenaofvalor/home/home.dart';
import 'package:arenaofvalor/loading.dart';

class signIn extends StatefulWidget {
  @override
  _signInState createState() => _signInState();
}

class _signInState extends State<signIn> {
  String _email;
  String _password;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool _loading = false;

  Widget _emailForm(height) {
    return Container(
      margin: EdgeInsets.only(bottom: height * 0.01),
      child: TextFormField(
        keyboardType: TextInputType.emailAddress,
        style: TextStyle(
            fontFamily: "FireCode", fontSize: 20, color: Colors.white),
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
                color: Colors.grey[400],
                fontFamily: "FireCode",
                fontSize: 22,
                letterSpacing: 3)),
        validator: (value) => value.isEmpty ? 'email is empty' : null,
        onSaved: (value) => _email = value,
      ),
    );
  }

  Widget _passwordForm(height) {
    return Container(
      margin: EdgeInsets.only(bottom: height * 0.01),
      child: TextFormField(
        keyboardType: TextInputType.visiblePassword,
        style: TextStyle(
            fontFamily: "FireCode", fontSize: 20, color: Colors.white),
        cursorWidth: 2,
        cursorRadius: Radius.circular(2),
        cursorColor: Colors.yellow[900],
        maxLength: 30,
        maxLines: 1,
        obscureText: true,
        decoration: InputDecoration(
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(color: Colors.white, width: 2)),
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(color: Colors.white)),
            counterText: '',
            hintText: 'password',
            hintStyle: TextStyle(
                fontFamily: "FireCode",
                fontSize: 22,
                letterSpacing: 3,
                color: Colors.grey[400])),
        validator: (value) => value.isEmpty ? 'Password is empty' : null,
        onSaved: (value) => _password = value,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return _loading
        ? loading()
        : Scaffold(
            body: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(colors: <Color>[
                  Color.fromRGBO(29, 33, 54, 1),
                  Color.fromRGBO(29, 33, 54, 0.95),
                ]),
              ),
              child: SafeArea(
                child: Form(
                  key: _formKey,
                  child: Container(
                    alignment: Alignment.center,
                    margin: EdgeInsets.only(
                        right: width * 0.05, left: width * 0.05),
                    child: ListView(
                        physics: NeverScrollableScrollPhysics(),
                        children: <Widget>[
                          Container(
                            margin: EdgeInsets.only(
                                top: height * 0.1, bottom: height * 0.2),
                            alignment: Alignment.center,
                            child: Text(
                              'You need to Login or create an account before you start',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontFamily: "FireCode",
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          _emailForm(height),
                          _passwordForm(height),
                          Container(
                            margin: EdgeInsets.only(top: height * 0.01), //10
                            child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: <Widget>[
                                  Text(
                                    "Don't have an account yet?  ",
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
                                              builder: (context) => signUp()),
                                        );
                                      },
                                      child: Text('REGISTER',
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
                              dynamic user =
                                  await _auth.signIn(_email, _password);
                              if (user == null) {
                                Fluttertoast.showToast(
                                    msg: "Wrong Email/Password",
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
                                    msg: "Login Successful",
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
                                  width * 0.2, height * 0.125, width * 0.2, 0),
                              padding:
                                  EdgeInsets.symmetric(vertical: height * 0.03),
                              decoration: BoxDecoration(
                                  gradient: LinearGradient(colors: <Color>[
                                    Color.fromRGBO(50, 50, 68, 1),
                                    Color.fromRGBO(50, 50, 68, 1)
                                        .withOpacity(0.8),
                                  ]),
                                  color: Colors.blue,
                                  border:
                                      Border.all(color: Colors.white, width: 1),
                                  borderRadius: BorderRadius.circular(10)),
                              alignment: Alignment.center,
                              child: Text(
                                'Log in',
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
          );
  }
}
