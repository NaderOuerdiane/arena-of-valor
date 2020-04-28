import 'package:flutter/material.dart';

class creditsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(colors: <Color>[
            Color.fromRGBO(29, 33, 54, 1),
            Color.fromRGBO(29, 33, 54, 0.95),
          ]),
        ),
        child: Center(
            child: Text(
                'Made with Love by Nader Ouerdiane \n nader_ouerdiane@hotmail.com',
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 20,
                    fontFamily: 'FireCode',
                    color: Colors.white,
                    fontWeight: FontWeight.bold))),
      ),
    );
  }
}
