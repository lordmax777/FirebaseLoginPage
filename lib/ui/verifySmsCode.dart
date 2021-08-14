import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'mainPage.dart';

FirebaseAuth _authUser = FirebaseAuth.instance;

class VerifySmsCode extends StatefulWidget {
  String? phone;
  VerifySmsCode(this.phone,{Key? key}) : super(key: key);

  @override
  _VerifySmsCodeState createState() => _VerifySmsCodeState();
}

class _VerifySmsCodeState extends State<VerifySmsCode> {
  TextEditingController smsCode = TextEditingController();
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Sms Kiriting"),
      ),
      body: Center(
        child: Form(
          key: _formKey,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          child: Column(
            children: [
              TextFormField(
                controller: smsCode,
                validator: (text){
                  if(text!.isEmpty){
                    return "Bo`sh Bolmasligi Kerak";
                  }
                },
              ),
              ElevatedButton(
                  onPressed: _phoneVerify,
                  child: Text("Sms Verify"),
              ),
            ],
          ),
        ),
      ),
    );
  }
  _phoneVerify() async {
    if(_formKey.currentState!.validate()){
      _formKey.currentState!.save();
      await _authUser.verifyPhoneNumber(
          phoneNumber: widget.phone!,
          verificationCompleted: (PhoneAuthCredential credential){},
          verificationFailed: (FirebaseAuthException credential){
            ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  duration: Duration(seconds: 3),
                    content: Text("Smsni Tekshirib Qaytadan Urinib Ko`ring !"),),);
          },
          codeSent: (String verificationId, int? resendToken) async {
            print("Sms Jonatildi !");
            PhoneAuthCredential phoneAuthCredential = PhoneAuthProvider.credential(
                verificationId: verificationId, smsCode: smsCode.text);
            await _authUser.signInWithCredential(phoneAuthCredential);
            await Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => MainPage()));
          },
          codeAutoRetrievalTimeout: (String text){
            print("Text $text");
          });
    }
  }
}
