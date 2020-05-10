import 'package:flutter/material.dart';

class MenuBox extends StatelessWidget {

  final String title;
  final String line1;
  final String line2;
  final String iconPos;

  MenuBox({ this.title, this.line1, this.line2, this.iconPos });
  
  Widget iconPosition (String iconPos) {
    if (iconPos == 'left') {
      return Row(
        children: <Widget>[
          SizedBox(width: 30.0,),
          Image.asset(
            'assets/images/${title.toLowerCase()}.png',
            width: 80.0,
          ),
          SizedBox(width: 20.0,),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                title,
                style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold
                ),
              ),
              Text(
                line1,
                style: TextStyle(
                  fontSize: 15.0,
                ),
              ),
              Text(
                line2,
                style: TextStyle(
                  fontSize: 15.0,
                ),
              ),
            ],
          ),
        ],
      );
    } else {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          SizedBox(width: 10.0,),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                title,
                style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold
                ),
              ),
              Text(
                line1,
                style: TextStyle(
                  fontSize: 15.0,
                ),
              ),
              Text(
                line2,
                style: TextStyle(
                  fontSize: 15.0,
                ),
              ),
            ],
          ),
          SizedBox(width: 20.0,),
          Image.asset(
            'assets/images/${title.toLowerCase()}.png',
            width: 80.0,
          ),
          SizedBox(width: 20.0,),
        ],
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
        color: Colors.white,
        child: Column(
          children: <Widget>[
            SizedBox(height: 20.0, width: 250.0,),
            iconPosition(iconPos),
            SizedBox(height: 20.0,),
          ],
        ),
      ),
    );
  }
}
