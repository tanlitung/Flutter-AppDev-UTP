import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class CommitteeCard extends StatelessWidget {

  final String imageUrl;
  final String name;
  final String position;
  final String course;
  final String email;
  final String websiteUrl;

  CommitteeCard({ this.imageUrl, this.name, this.position, this.course, this.email, this.websiteUrl });

  _launchURL() async {
    if (await canLaunch(websiteUrl)) {
      await launch(websiteUrl, forceWebView: true);
    } else {
      throw 'Could not launch $websiteUrl';
    }
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {_launchURL();},
      child: Padding(
        padding: const EdgeInsets.fromLTRB(15.0, 0.0, 15.0, 10.0),
        child: Card(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
          color: Colors.white,
          child: Column(
            children: <Widget>[
              SizedBox(height: 10.0, width: 250.0,),
              Row(
                children: <Widget>[
                  SizedBox(width: 20.0,),
                  CircleAvatar(
                    radius: 40.0,
                    backgroundImage: NetworkImage(imageUrl),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
                    child: Container(
                      color: Colors.black,
                      width: 1.0,
                      height: 80.0,
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        name,
                        style: TextStyle(
                            fontSize: 15.0,
                            fontWeight: FontWeight.bold
                        ),
                      ),
                      Text(
                        position,
                        style: TextStyle(
                          fontSize: 16.0,
                        ),
                      ),
                      Text(
                        course,
                        style: TextStyle(
                          fontSize: 12.0,
                        ),
                      ),
                      Text(
                        email,
                        style: TextStyle(
                          fontSize: 11.0,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 10.0,),

            ],
          ),
        ),
      ),
    );
  }
}
