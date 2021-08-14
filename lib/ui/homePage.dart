import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'errorPage.dart';
import 'loadingPage.dart';
import 'loginPage.dart';

class HomePage extends StatefulWidget {

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final Future<FirebaseApp> _init = Firebase.initializeApp();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _init,
      builder: (context, snapshot){
        if(snapshot.hasError){
          return SomethingWentWrong();
    }
        if(snapshot.connectionState == ConnectionState.done){
          return LoginPage();
        }
        return LoadingPage();
      },
    );
  }
}
