import 'package:flutter/material.dart';
import 'package:utpappdev/model/slide.dart';

class SlideItem extends StatelessWidget {

  final int index;
  SlideItem(this.index);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          shape: BoxShape.rectangle,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20.0),
                topRight: Radius.circular(20.0),
                bottomLeft: Radius.circular(20.0),
                bottomRight: Radius.circular(20.0),
            )
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              height: 190,
              width: 190,
              decoration: BoxDecoration(
                image: DecorationImage(image: AssetImage(slideList[index].imageUrl)),
              ),
            ),
            SizedBox(height: 20.0,),
            Text(
              slideList[index].title,
              style: TextStyle(
                fontSize: 22.0,
                color: Colors.indigo[600],
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20.0,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 50.0),
              child: Text(
                slideList[index].description,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.indigo[400],
                ),
              ),
            ),
            SizedBox(height: 20.0,),
          ],
        ),
      ),
    );
  }
}
