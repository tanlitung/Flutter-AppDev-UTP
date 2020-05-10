import 'package:flutter/material.dart';
import 'package:utpappdev/services/auth.dart';
import 'package:utpappdev/shared/constant.dart';
import 'package:utpappdev/shared/loading.dart';

class Register extends StatefulWidget {

  final Function toggleView;
  Register({ this.toggleView });

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {

  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();
  bool loading = false;

  // Text field state
  String email ="";
  String password = "";
  String error = "";

  @override
  Widget build(BuildContext context) {
    return loading ? Loading() : Scaffold(
      body: Container(
        constraints: BoxConstraints.expand(),
        decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [Colors.lightBlue[300], Colors.indigo[900]]),
        ),
        child: Center(
          child: SingleChildScrollView(
            child: Card(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
              margin: EdgeInsets.fromLTRB(30.0, 40.0, 30.0, 40.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Center(
                    child: Column(
                      children: <Widget>[
                        SizedBox(height: 50.0,),
                        Image.asset(
                          'assets/images/utpadc-logo-black.png',
                          width: 200.0,
                        ),
                        SizedBox(height: 20.0,),
                        Text(
                          'Set Up Your Account Now!',
                          style: TextStyle(
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold
                          ),
                        ),
                        SizedBox(height: 20.0,),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 40.0),
                          child: Form(
                            key: _formKey,
                            child: Column(
                              children: <Widget>[
                                TextFormField(
                                  decoration: textInputDecoration.copyWith(
                                      hintText: 'UTP Email',
                                      prefixIcon: Icon(Icons.email),
                                  ),
                                  validator: (val) => val.contains('@utp.edu.my') ?  null : 'Please enter your UTP Email',
                                  onChanged: (val) {
                                    setState(() {
                                      email = val;
                                    });
                                  },
                                ),
                                SizedBox(height: 20.0,),
                                TextFormField(
                                  decoration: textInputDecoration.copyWith(
                                      hintText: 'Password',
                                      prefixIcon: Icon(Icons.lock),
                                  ),
                                  validator: (val) => val.length < 6 ? 'Password too short' : null,
                                  obscureText: true,
                                  onChanged: (val) {
                                    setState(() {
                                      password = val;
                                    });
                                  },
                                ),
                                SizedBox(height: 20.0,),
                                RaisedButton(
                                  color: Colors.indigo,
                                  child: Text(
                                    'Register',
                                    style: TextStyle(
                                      color: Colors.white,
                                    ),
                                  ),
                                  onPressed: () async {
                                    if (_formKey.currentState.validate()) {
                                      setState(() => loading = true);
                                      dynamic result = await _auth.registerWithEmailAndPassword(email, password);
                                      if (result == null) {
                                        setState(() {
                                          error = "Couldn\'t register this email.";
                                          loading = false;
                                        });
                                      }
                                    }
                                  },
                                ),
                                SizedBox(height: 20.0,),
                                Text(
                                    'Have an existing account?'
                                ),
                                InkWell(
                                  onTap: () {
                                    widget.toggleView();
                                  },
                                  child: Text(
                                    'Sign In',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold
                                    ),
                                  ),
                                ),
                                SizedBox(height: 10.0,),
                                Text(
                                  error,
                                  style: TextStyle(color: Colors.red, fontSize: 12.0),
                                ),
                                SizedBox(height: 20.0,),
                              ],
                            ),
                          ),
                        ),

                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}