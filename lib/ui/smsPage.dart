import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:untitled16/ui/verifySmsCode.dart';

FirebaseAuth _authUser = FirebaseAuth.instance;

class SmsPage extends StatefulWidget {

  @override
  _SmsPageState createState() => _SmsPageState();
}

class _SmsPageState extends State<SmsPage> {
  var _formKey = GlobalKey<FormState>();
  String? phone;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: Text("Sms Page", style: TextStyle(color: Colors.black),),
      ),
      body: Center(
        child: Form(
          key: _formKey,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          child: Column(
            children: [
              Padding(
                padding:
                const EdgeInsets.only(left: 22.0, right: 22.0, top: 25.0),
                child: TextFormField(
                  initialValue: "+998",
                  keyboardType: TextInputType.phone,
                  maxLength: 13,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.grey.shade200,
                    contentPadding: EdgeInsets.fromLTRB(20.0, 18.0, 20.0, 18.0),
                    hintText: "Phone Number",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(18.0),
                      borderSide: BorderSide.none,
                    ),
                  ),
                  validator: (text) {
                    if (text!.length < 13) {
                      return "Kamida 13 ta Belgi Kiriting";
                    }
                  },
                ),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(primary: Colors.blue),
                child: Text("Sms Jonating"),
                onPressed: () async {
                  if(_formKey.currentState!.validate()){
                    _formKey.currentState!.save();
                    await Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => VerifySmsCode(phone)));
                  }
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
