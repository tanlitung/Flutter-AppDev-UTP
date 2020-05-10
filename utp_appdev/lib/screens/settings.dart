import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:utpappdev/model/user.dart';
import 'package:utpappdev/services/auth.dart';
import 'package:utpappdev/services/database.dart';
import 'package:utpappdev/shared/constant.dart';
import 'package:utpappdev/shared/loading.dart';

class Settings extends StatefulWidget {
  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {

  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();
  bool loading = false;

  final List<String> course = ['Select Course', 'EE', 'CoE', 'ME', 'CE', 'PE', 'PG', 'CS', 'IT', 'IS', 'AP', 'AC', 'CV'];

  String _currentName;
  String _currentCourse;

  @override
  Widget build(BuildContext context) {

    final user = Provider.of<User>(context);

    return StreamBuilder<UserData>(
      stream: DatabaseService(uid: user.uid).userData,
      builder: (context, snapshot) {

        if (snapshot.hasData) {

          UserData userData = snapshot.data;

          return Scaffold(
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
                      margin: EdgeInsets.fromLTRB(30.0, 0.0, 30.0, 0.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: <Widget>[
                          Center(
                            child: Column(
                              children: <Widget>[
                                SizedBox(height: 30.0,),

                                Row(
                                  children: <Widget>[
                                    FlatButton.icon(
                                      onPressed: () {Navigator.pop(context);},
                                      icon: Icon(Icons.arrow_back),
                                      label: Text(''),

                                    ),
                                    Text(
                                      'Manage Your Account',
                                      style: TextStyle(
                                          fontSize: 20.0,
                                          fontWeight: FontWeight.bold
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 30.0,),
                                Image.asset('assets/images/utpadc-logo-black.png', width: 200,),
                                SizedBox(height: 30.0,),
                                Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 40.0),
                                  child: Form(
                                    key: _formKey,
                                    child: Column(
                                      children: <Widget>[
                                        TextFormField(
                                          initialValue: userData.name,
                                          decoration: textInputDecoration.copyWith(
                                            hintText: 'Username',
                                            prefixIcon: Icon(Icons.person),
                                          ),
                                          validator: (val) => val.isEmpty ? 'Please enter an username' : null,
                                          onChanged: (val) => setState(() => _currentName = val),
                                        ),
                                        SizedBox(height: 20.0,),

                                        DropdownButtonFormField(
                                          decoration: textInputDecoration,
                                          value: _currentCourse ?? userData.course,
                                          items: course.map((course) {
                                            return DropdownMenuItem(
                                              value: course,
                                              child: Text('$course'),
                                            );
                                          }).toList(),
                                          onChanged: (val) => setState(() => _currentCourse = val),
                                        ),
                                        SizedBox(height: 20.0,),
                                        RaisedButton(
                                          color: Colors.indigo,
                                          child: Text(
                                            'Update Profile',
                                            style: TextStyle(
                                              color: Colors.white,
                                            ),
                                          ),
                                          onPressed: () async {
                                            if(_formKey.currentState.validate()) {
                                              await DatabaseService(uid: user.uid).updateUserData(
                                                  _currentName ?? userData.name,
                                                  _currentCourse ?? userData.course,
                                              );
                                              Navigator.pop(context);
                                            }
                                          },
                                        ),
                                        SizedBox(height: 10.0,),

                                        RaisedButton(
                                          color: Colors.red,
                                          child: Padding(
                                            padding: const EdgeInsets.symmetric(horizontal: 23.0),
                                            child: Text(
                                              'Logout',
                                              style: TextStyle(
                                                color: Colors.white,
                                              ),
                                            ),
                                          ),
                                          onPressed: () async {
                                            await _auth.signOut();
                                            Navigator.pop(context);
                                          },
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
              )
          );
        } else {
          return Loading();
        }
      }
    );
  }
}
