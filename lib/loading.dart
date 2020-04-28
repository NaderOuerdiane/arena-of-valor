import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class loading extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(colors: <Color>[
              Color.fromRGBO(29, 33, 54, 1),
              Color.fromRGBO(29, 33, 54, 0.95),
            ]),
          ),
          child: SafeArea(
            child: Center(
              child: SpinKitFadingFour(
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
