import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:utpappdev/authenticate/authenticate.dart';
import 'package:utpappdev/home/home.dart';
import 'package:utpappdev/model/user.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final user = Provider.of<User>(context);

    // Return either home or authenticate screen
    if (user == null) {
      return Authenticate();
    } else {
      return Home();
    }

  }
}
