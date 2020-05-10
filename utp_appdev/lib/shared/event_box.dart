import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class EventBox extends StatelessWidget {

  final String imageUrl;
  final String title;
  final String description;
  final String registerUrl;
  final String date;
  final String fee;

  EventBox({ this.imageUrl, this.title, this.description, this.registerUrl, this.date, this.fee });

  Widget feeText(fee) {
    if(fee == '0')
      return Text(
        '',
        style: TextStyle(
          fontSize: 15.0,
        ),
      );
    else
      return Text(
      'RM $fee',
      style: TextStyle(
        fontSize: 15.0,
      ),
    );
  }

  _launchURL() async {
    if (await canLaunch(registerUrl)) {
      await launch(registerUrl, forceWebView: true);
    } else {
      throw 'Could not launch $registerUrl';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(15.0, 0.0, 15.0, 20.0),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
        color: Colors.white,
        child: Column(
          children: <Widget>[
            SizedBox(height: 20.0, width: 250.0,),
            Row(
              children: <Widget>[
                SizedBox(width: 30.0,),
                Image.asset(
                  imageUrl,
                  width: 80.0,
                ),
                SizedBox(width: 20.0,),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      title,
                      style: TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold
                      ),
                    ),
                    Text(
                      date,
                      style: TextStyle(
                          fontSize: 15.0,
                      ),
                    ),
                    feeText(fee),
                  ],
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
              child: Container(
                color: Colors.black,
                height: 1.0,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Text(
                description,
                style: TextStyle(
                  fontSize: 15.0,
                ),
              ),
            ),
            SizedBox(height: 10.0,),
            FlatButton(
              color: Colors.indigo,
              onPressed: () {_launchURL();},
              child: Text(
                  'Learn More',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
            SizedBox(height: 10.0,)
          ],
        ),
      ),
    );
  }
}
