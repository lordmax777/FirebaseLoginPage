import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'loginPage.dart';

FirebaseAuth _authUser = FirebaseAuth.instance;

class UpgatePasswordPage extends StatefulWidget {
  const UpgatePasswordPage({Key? key}) : super(key: key);

  @override
  _UpgatePasswordPageState createState() => _UpgatePasswordPageState();
}

class _UpgatePasswordPageState extends State<UpgatePasswordPage> {
  var _formKey = GlobalKey<FormState>();
  TextEditingController password = TextEditingController();
  TextEditingController confirmpassword = TextEditingController();
  bool _turfolse = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Password Update"),
      ),
      body: Center(
        child: Form(
          key: _formKey,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          child: Padding(
            padding: EdgeInsets.all(14.0),
            child: Column(
              children: [
                Padding(
                  padding:
                  const EdgeInsets.only(left: 22.0, right: 22.0, top: 30.0),
                  child: TextFormField(
                    scrollPadding: EdgeInsets.all(50.0),
                    keyboardType: TextInputType.visiblePassword,
                    obscureText: _turfolse,
                    decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.grey[200],
                        contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                        hintText: "Password",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(18.0),
                          borderSide: BorderSide.none,
                        ),
                        suffixIcon: IconButton(
                          splashColor: Colors.white,
                          onPressed: _toggle,
                          icon: Icon(
                            Icons.visibility_outlined,
                            color: Colors.grey,
                          ),
                        )),
                    controller: password,
                    validator: (text) {
                      if (text!.length < 6) {
                        return "Kamida 6 ta Belgi Kiriting";
                      }
                    },
                  ),
                ),
                Padding(
                  padding:
                  const EdgeInsets.only(left: 22.0, right: 22.0, top: 30.0),
                  child: TextFormField(
                    scrollPadding: EdgeInsets.all(50.0),
                    keyboardType: TextInputType.visiblePassword,
                    obscureText: _turfolse,
                    decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.grey[200],
                        contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                        hintText: "Confirm Password",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(18.0),
                          borderSide: BorderSide.none,
                        ),
                        suffixIcon: IconButton(
                          splashColor: Colors.white,
                          onPressed: _toggle,
                          icon: Icon(
                            Icons.visibility_outlined,
                            color: Colors.grey,
                          ),
                        )),
                    controller: confirmpassword,
                    validator: (text) {
                      if (text!.isEmpty) {
                        return "Bo`sh Bo`lmasligi Kerak !";
                      }else{
                        if(password.text != confirmpassword.text){
                          print("Yangi Password: " + password.text);
                          return "Passwordlar To`g`ri Kelmadi";
                        }
                      }
                    },
                  ),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.cyanAccent
                  ),
                    onPressed: _updatePassword,
                    child: Text("Update Password"),),
              ],
            ),
          ),
        ),
      )
    );
  }
  void _toggle() {
    setState(() {
      _turfolse = !_turfolse;
    });
  }
  _updatePassword() async {
    if(_formKey.currentState!.validate()){
      try{
        _formKey.currentState!.save();
        print("Update Password method confirm Password: " + confirmpassword.text);

        await _authUser.currentUser!.updatePassword(confirmpassword.text);
        await Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginPage()));
      }catch(e) {
        print("Email Topilmadi Yoki Error");
      }
    }
  }
}
