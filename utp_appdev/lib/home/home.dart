import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:utpappdev/home/menu_box.dart';
import 'package:utpappdev/screens/committee.dart';
import 'package:utpappdev/screens/introduction.dart';
import 'package:utpappdev/screens/settings.dart';
import 'package:utpappdev/screens/upcoming.dart';
//import 'package:utpappdev/services/auth.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:utpappdev/services/database.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  //final AuthService _auth = AuthService();

  final String url = 'https://docs.google.com/forms/d/e/1FAIpQLSekeC4cvv7d42sxOS4LfW1ytLBE8mqa8hT7VNSs4Gvrm2Zk8A/viewform';

  _launchURL() async {
    const url = "https://docs.google.com/forms/d/e/1FAIpQLSekeC4cvv7d42sxOS4LfW1ytLBE8mqa8hT7VNSs4Gvrm2Zk8A/viewform";
    if (await canLaunch(url)) {
      await launch(url, forceWebView: true);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {

    return StreamProvider<QuerySnapshot>.value(
      value: DatabaseService().profiles,
      child: Scaffold(
        body: Container(
          constraints: BoxConstraints.expand(),
          decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: [Colors.lightBlue[300], Colors.indigo[900]]),
          ),
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                SizedBox(height: 80.0,),
                Image.asset(
                    'assets/images/utpadc-logo-white.png',
                  width: 150.0,
                ),
                SizedBox(height: 30.0,),
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Introduction()),
                    );
                  },
                    child: MenuBox(title: 'Introduction', line1: 'Learn more about UTP App', line2: 'Development Club!', iconPos: 'left',)
                ),
                SizedBox(height: 10.0,),
                InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Upcoming()),
                      );
                    },
                    child: MenuBox(title: 'Upcoming', line1: 'Join the club\'s upcoming', line2: 'activities and workshops!', iconPos: 'right',)
                ),
                SizedBox(height: 10.0,),
                InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Committee()),
                      );
                    },
                    child: MenuBox(title: 'Committee', line1: 'Find out who are the Tech', line2: 'people in the club!', iconPos: 'left',)
                ),
                SizedBox(height: 10.0,),
                InkWell(
                    onTap: () {_launchURL();},
                    child: MenuBox(title: 'Join', line1: 'Wanna be part of us?', line2: 'Tap here to join us!', iconPos: 'right',)
                ),
                SizedBox(height: 10.0,),
                InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Settings()),
                      );
                    },
                    child: MenuBox(title: 'Profile', line1: 'Tap here to view your', line2: 'personal profile!', iconPos: 'left',)
                ),
                SizedBox(height: 10.0,),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
