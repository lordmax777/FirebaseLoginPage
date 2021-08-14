import 'package:flutter/material.dart';

class SomethingWentWrong extends StatelessWidget {
  const SomethingWentWrong({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: Text(
          "Error Page",
          style: TextStyle(
            color: Colors.black,
          ),
        ),
      ),
      body: Center(
        child: Text(
          "Firebase is not connected !",
          style: TextStyle(fontSize: 44.0, color: Colors.red),
        ),
      ),
    );
  }
}