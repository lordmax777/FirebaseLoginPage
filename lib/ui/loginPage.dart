import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:untitled16/ui/signUpPage.dart';
import 'package:untitled16/ui/smsPage.dart';
import 'package:untitled16/ui/update_password.dart';
import 'forgot_password.dart';
import 'mainPage.dart';

FirebaseAuth _authUser = FirebaseAuth.instance;

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  var _formKey = GlobalKey<FormState>();
  bool isChecked = false;
  bool isChecked1 = false;
  bool _turfolse = true;
  String? email;
  String? password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Column(
        children: [
          Center(
            child: Padding(
              padding: const EdgeInsets.only(
                  top: 110.0, right: 50.0, left: 40.0, bottom: 50.0),
              child: Text(
                "Sign in",
                style: TextStyle(
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
            ),
          ),
          Form(
            key: _formKey,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            child: Column(
              children: [
// Email Uchun
                Padding(
                  padding:
                      const EdgeInsets.only(left: 22.0, right: 22.0, top: 10.0),
                  child: TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.grey.shade200,
                      contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                      hintText: "Email Address",
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
// Password da
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
                    onSaved: (e) {
                      password = e;
                    },
                    validator: (text) {
                      if (text!.length < 6) {
                        return "Kamida 6 ta Belgi Kiriting";
                      }
                    },
                  ),
                ),
// Remember update
              SizedBox(height: 10.0,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Row(
                      children: [
                        Checkbox(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5.0)
                          ),
                          checkColor: Colors.white,
                          value: isChecked1,
                          onChanged: (bool? value) {
                            setState(() {
                              isChecked1 = value!;
                            });
                          },
                        ),
                        Text("Remember me",style: TextStyle(fontWeight: FontWeight.w500),),
                      ],
                    ),
                    TextButton(
                      onPressed: (){
                        Navigator.of(context).push(MaterialPageRoute(builder: (context) => UpgatePasswordPage()));
                      },
                      child: Text("Update password?", style: TextStyle(fontSize: 11.0),),
                    ),
                    TextButton(
                      onPressed: (){
                        Navigator.of(context).push(MaterialPageRoute(builder: (context) => ForgotPassword()));
                      },
                      child: Text("Forgot password?",  style: TextStyle(fontSize: 11.0),),
                    ),
                  ],
                ),
 //Sign In
                Padding(
                  padding: const EdgeInsets.only(left: 22.0, right: 22.0, top: 15.0),
                  child: InkWell(
                    child: Container(
                      height: 50.0,
                      decoration: BoxDecoration(
                        color: Color.fromRGBO(1,174,216,1),
                        borderRadius: BorderRadius.circular(18.0),
                      ),
                      child: Center(child: Text("Sign in", style: TextStyle(fontWeight: FontWeight.w700, color: Colors.white),)),
                    ),
                    onTap: _emailSignIn,
                  ),
                ),
 // or use
                Padding(
                  padding: const EdgeInsets.only(top: 15.0, bottom: 5.0),
                  child: Center(
                    child: InkWell(
                      child: Text("Or use", style: TextStyle(color: Colors.grey, fontWeight: FontWeight.w600),),
                    )
                  ),
                ),
 // Facebook
                Padding(
                  padding: const EdgeInsets.only(left: 22.0, right: 22.0, top: 15.0),
                  child: InkWell(
                    child: Container(
                      height: 50.0,
                      decoration: BoxDecoration(
                        color: Colors.grey.shade100,
                        borderRadius: BorderRadius.circular(18.0),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CircleAvatar(
                            backgroundImage: AssetImage("assets/images/facebook.jpeg"),
                          ),
                          SizedBox(width: 15.0,),
                          Text("Facebook", style: TextStyle(fontWeight: FontWeight.bold),)
                        ],
                      ),
                    ),
                  ),
                ),
 // Google
                Padding(
                  padding: const EdgeInsets.only(left: 22.0, right: 22.0, top: 20.0),
                  child: InkWell(
                    child: Container(
                      height: 50.0,
                      decoration: BoxDecoration(
                        color: Colors.grey.shade100,
                        borderRadius: BorderRadius.circular(18.0),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CircleAvatar(
                            backgroundImage: AssetImage("assets/images/google.jpg"),
                          ),
                          SizedBox(width: 32.0,),
                          Text("Google", style: TextStyle(fontWeight: FontWeight.bold),)
                        ],
                      ),
                    ),
                    onTap:() => _googleSignIn(),
                  ),
                ),
 // GitHub
                Padding(
                  padding: const EdgeInsets.only(left: 22.0, right: 22.0, top: 20.0),
                  child: InkWell(
                    child: Container(
                      height: 50.0,
                      decoration: BoxDecoration(
                        color: Colors.grey.shade100,
                        borderRadius: BorderRadius.circular(18.0),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CircleAvatar(
                            backgroundColor: Colors.white,
                            backgroundImage: AssetImage("assets/images/git.png"),
                          ),
                          SizedBox(width: 32.0,),
                          Text("GitHub", style: TextStyle(fontWeight: FontWeight.bold),)
                        ],
                      ),
                    ),
                  ),
                ),
// Sms
                Padding(
                  padding: const EdgeInsets.only(left: 22.0, right: 22.0, top: 20.0),
                  child: InkWell(
                    child: Container(
                      height: 50.0,
                      decoration: BoxDecoration(
                        color: Colors.grey.shade100,
                        borderRadius: BorderRadius.circular(18.0),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CircleAvatar(
                            backgroundColor: Colors.white,
                            child: Icon(Icons.sms),
                          ),
                          SizedBox(width: 32.0,),
                          Text("Sms", style: TextStyle(fontWeight: FontWeight.bold),)
                        ],
                      ),
                    ),
                    onTap: (){
                      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => SmsPage()));
                    },
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.only(top: 30.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Don`t have an account? ", style: TextStyle(color: Colors.grey),),
                      InkWell(
                        child: Text("Sign up", style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),),
                        onTap: (){
                          Navigator.of(context).push(MaterialPageRoute(builder: (context) => SignUpPage()));
                        },
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
  void _toggle() {
    setState(() {
      _turfolse = !_turfolse;
    });
  }
  _emailSignIn() async {
    try {
      if (_formKey.currentState!.validate()) {
        _formKey.currentState!.save();
        FocusScope.of(context).unfocus();
        User _signInQilganUser = (await _authUser.signInWithEmailAndPassword(
            email: email!, password: password!))
            .user!;

        print("User Tizimga Kirdi: ${_signInQilganUser.email}");
        if (_signInQilganUser.emailVerified) {
          Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (context) => MainPage()));
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              duration: Duration(seconds: 3),
              content: Text("Emailni Tekshirib Qaytadan Urinib Ko'ring !"),
            ),
          );
        }
      }
    } catch (e) {
      print("XATO: " + e.toString());
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          duration: Duration(seconds: 3),
          content: Text("Email yoki Password Xato !"),
        ),
      );
    }
  }
  void _signOut() async {
    if (_authUser.currentUser != null) {
      await _authUser.signOut();
    } else {
      print("Shundoqham User Yo'q !");
    }
  }
  _googleSignIn() async{
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
    final GoogleSignInAuthentication? googleAuth = await googleUser!.authentication;

    var credential = GoogleAuthProvider.credential(
      accessToken: googleAuth!.accessToken,
      idToken: googleAuth.idToken);
  
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }


  // void _signOut() async {
  //   if (_authUser.currentUser != null) {
  //     await _authUser.signOut();
  //   } else {
  //     print("Shundoqham User Yo'q !");
  //   }
  // }
}
