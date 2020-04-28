import 'package:flutter/material.dart';
import 'package:arenaofvalor/home/authhome.dart';
import 'package:arenaofvalor/Services/AuthService.dart';
import 'package:arenaofvalor/home/home.dart';
import 'package:arenaofvalor/loading.dart';

class Wrapper extends StatefulWidget {
  @override
  _WrapperState createState() => _WrapperState();
}

class _WrapperState extends State<Wrapper> {
  Future checkStatut() async {
    if (await AuthService().statut() == null) {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => authhome()));
    } else {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => home()));
    }
  }

  @override
  void initState() {
    checkStatut();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return loading();
  }
}
