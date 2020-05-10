import 'package:flutter/material.dart';
import 'package:utpappdev/model/user.dart';
import 'package:utpappdev/screens/wrapper.dart';
import 'package:utpappdev/services/auth.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamProvider<User>.value(
      value: AuthService().user, // listening to user auth changing stream
      child: MaterialApp(
        home: Wrapper(),
      ),
    );
  }
}

