import 'package:flutter/material.dart';
import 'package:utpappdev/shared/event_box.dart';

class Upcoming extends StatefulWidget {
  @override
  _UpcomingState createState() => _UpcomingState();
}

class _UpcomingState extends State<Upcoming> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
              SizedBox(height: 50.0,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  FlatButton.icon(
                    icon: Icon(Icons.arrow_back, color: Colors.white,),
                    onPressed: () => Navigator.pop(context),
                    label: Text(''),
                  ),
                  Text(
                    'Upcoming Events',
                    style: TextStyle(
                      fontSize: 20.0,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(width: 80.0),
                ],
              ),
              SizedBox(height: 10.0,),
              SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    EventBox(
                      imageUrl: 'assets/images/html.png',
                      title: 'UTP ADC Web',
                      description: 'Our website is officially released ! Check it out at utpadc.github.io or hit the button below !',
                      registerUrl: 'https://utpadc.github.io',
                      date: '9 May 2020',
                      fee: '0',
                    ),

                    EventBox(
                      imageUrl: 'assets/images/flutter.png',
                      title: 'UTP ADC App',
                      description: 'Our mobile application is officially released ! Check it out at Google PlayStore or AppStore !',
                      registerUrl: 'https://utpadc.github.io',
                      date: '11 May 2020',
                      fee: '0',
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
