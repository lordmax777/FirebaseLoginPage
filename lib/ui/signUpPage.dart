import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'loginPage.dart';

FirebaseAuth _authUser = FirebaseAuth.instance;

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  var _formKey = GlobalKey<FormState>();
  String? email;
  String? password;
  bool isChecked = false;
  bool _turfolse = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          elevation: 0.0,
          backgroundColor: Colors.white,
          toolbarHeight: 112.0,
          flexibleSpace: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 70.0, bottom: 20.0),
                child: Text(
                  "Sign up",
                  style: TextStyle(
                      fontSize: 24.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Already have an account? ",
                      style: TextStyle(color: Colors.grey)),
                  InkWell(
                    child: Text(
                      "Sign in",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.blue),
                    ),
                    onTap: (){
                      Navigator.of(context).push(MaterialPageRoute(builder: (context) => LoginPage()));
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
        body: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Form(
            key: _formKey,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            child: Column(
                children: [
// Email
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
// Name
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 22.0, right: 22.0, top: 5.0),
                    child: TextFormField(
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.grey.shade200,
                        contentPadding: EdgeInsets.fromLTRB(20.0, 18.0, 20.0, 18.0),
                        hintText: "Full Name",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(18.0),
                          borderSide: BorderSide.none,
                        ),
                      ),
                      validator: (text) {
                        if (text!.length < 10) {
                          return "Kamida 10 ta Belgi Kiriting";
                        }
                      },
                    ),
                  ),
// userName
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 22.0, right: 22.0, top: 25.0),
                    child: TextFormField(
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.grey.shade200,
                        contentPadding: EdgeInsets.fromLTRB(20.0, 18.0, 20.0, 18.0),
                        hintText: "Username",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(18.0),
                          borderSide: BorderSide.none,
                        ),
                      ),
                      validator: (text) {
                        if (text!.length < 6) {
                          return "Kamida 6 ta Belgi Kiriting";
                        }
                      },
                    ),
                  ),
// phoneNumber
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 22.0, right: 22.0, top: 25.0),
                    child: TextFormField(
                      initialValue: "+998",
                      keyboardType: TextInputType.number,
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
                        if (text!.length < 9) {
                          return "Kamida 9 ta Belgi Kiriting";
                        }
                      },
                    ),
                  ),
// password
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 22.0, right: 22.0, top: 25.0),
                    child: TextFormField(
                      scrollPadding: EdgeInsets.all(50.0),
                      keyboardType: TextInputType.visiblePassword,
                      obscureText: _turfolse,
                      decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.grey[200],
                          contentPadding:
                              EdgeInsets.fromLTRB(20.0, 18.0, 20.0, 18.0),
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
 // checkbox
                  Padding(
                    padding: const EdgeInsets.only(top: 10.0, left: 20.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Checkbox(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5.0)
                          ),
                          checkColor: Colors.white,
                          value: isChecked,
                          onChanged: (bool? value) {
                            setState(() {
                              isChecked = value!;
                            });
                          },
                        ),
                        Text("I agree to the ",style: TextStyle(fontWeight: FontWeight.w500),),
                        InkWell(child: Text("Terms & Conditions", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.blue),),),
                      ],
                    ),
                  ),
//Sign up
                  Padding(
                    padding: const EdgeInsets.only(left: 22.0, right: 22.0, top: 15.0),
                    child: InkWell(
                      child: Container(
                        height: 50.0,
                        decoration: BoxDecoration(
                          color: Color.fromRGBO(1,174,216,1),
                          borderRadius: BorderRadius.circular(18.0),
                        ),
                        child: Center(child: Text("Sign up", style: TextStyle(fontWeight: FontWeight.w700, color: Colors.white),)),
                      ),
                      onTap: _emailSignUp,
                    ),
                  ),
                ],

            ),
          ),
        ),);
  }

  void _toggle() {
    setState(() {
      _turfolse = !_turfolse;
    });
  }
  _emailSignUp() async {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      try {
        UserCredential _credential = await _authUser
            .createUserWithEmailAndPassword(email: email!, password: password!);

        User _newUser = _credential.user!;
        await _newUser.sendEmailVerification();
        if (_authUser.currentUser != null) {
          await _authUser.signOut();
          await Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (context) => LoginPage()));
        }
        print(_newUser.email);
      } catch (e) {
        print("XATO: " + e.toString());
      }
    }
  }
}
/*
// Email
          Padding(
            padding:
            const EdgeInsets.only(left: 22.0, right: 22.0, top: 45.0, bottom: 20.0),
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
// Name
          Padding(
            padding:
            const EdgeInsets.only(left: 22.0, right: 22.0, top: 5.0),
            child: TextFormField(
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.grey.shade200,
                contentPadding: EdgeInsets.fromLTRB(20.0, 18.0, 20.0, 18.0),
                hintText: "Full Name",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(18.0),
                  borderSide: BorderSide.none,
                ),
              ),
              onSaved: (e) {
                name = e;
              },
              validator: (text) {
                if (text!.length < 20) {
                  return "Kamida 20 ta Belgi Kiriting";
                }
              },
            ),
          ),
// userName
          Padding(
            padding:
            const EdgeInsets.only(left: 22.0, right: 22.0, top: 25.0),
            child: TextFormField(
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.grey.shade200,
                contentPadding: EdgeInsets.fromLTRB(20.0, 18.0, 20.0, 18.0),
                hintText: "Username",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(18.0),
                  borderSide: BorderSide.none,
                ),
              ),
              onSaved: (e) {
                username = e;
              },
              validator: (text) {
                if (text!.length < 8) {
                  return "Kamida 8 ta Belgi Kiriting";
                }
              },
            ),
          ),
// phoneNumber
          Padding(
            padding:
            const EdgeInsets.only(left: 22.0, right: 22.0, top: 25.0),
            child: TextFormField(
              initialValue: "+998",
              keyboardType: TextInputType.number,
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
              onSaved: (e){
                phoneNum = e as int?;
              },
              validator: (text) {
                if (text!.length < 9) {
                  return "Kamida 9 ta Belgi Kiriting";
                }
              },
            ),
          ),
// password
          Padding(
            padding:
            const EdgeInsets.only(left: 22.0, right: 22.0, top: 25.0),
            child: TextFormField(
              scrollPadding: EdgeInsets.all(50.0),
              keyboardType: TextInputType.visiblePassword,
              obscureText: _turfolse,
              decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.grey[200],
                  contentPadding: EdgeInsets.fromLTRB(20.0, 18.0, 20.0, 18.0),
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
          ),*/

/*Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 80.0, bottom: 20.0),
            child: Text("Sign up",
                style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
                color: Colors.black),),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Already have an account? ", style: TextStyle(color: Colors.grey)),
              InkWell(
                child: Text("Sign in", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.blue),),
              )
            ],
          ),


        ],
      ),*/
