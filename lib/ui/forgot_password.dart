import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

FirebaseAuth _authUser = FirebaseAuth.instance;

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({Key? key}) : super(key: key);

  @override
  _ForgotPasswordState createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  var _formKey = GlobalKey<FormState>();
  String? email;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Reset Pasword"),
      ),
      body: Center(
        child: Form(
          key: _formKey,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                      left: 22.0, right: 22.0, top: 45.0, bottom: 20.0),
                  child: TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.grey.shade200,
                      contentPadding: EdgeInsets.fromLTRB(20.0, 18.0, 20.0, 18.0),
                      hintText: "Email",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(18.0),
                        borderSide: BorderSide.none,
                      ),
                    ),
                    onSaved: (e) {
                      email = e;
                    },
                    validator: (text) {
                      if (text!.length < 6) {
                        return "Kamida 6 ta Belgi Kiriting";
                      }
                    },
                  ),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(primary: Colors.orange),
                    onPressed: _resetPassword,
                    child: Text("Reset Password"))
              ],
            ),
        ),
      ),
    );
  }
  _resetPassword() async{
    if(_formKey.currentState!.validate()){
      try{
        _formKey.currentState!.save();
        print(email);
        await _authUser.sendPasswordResetEmail(email: email!);
      }catch(e){
        print("Email Topilmadi Yoki Error");
      }
    }
  }
}
