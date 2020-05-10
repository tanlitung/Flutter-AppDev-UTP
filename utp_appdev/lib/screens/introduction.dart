import 'package:flutter/material.dart';
import 'package:utpappdev/model/slide.dart';
import 'package:utpappdev/shared/slide_dots.dart';
import 'package:utpappdev/shared/slide_items.dart';

class Introduction extends StatefulWidget {

  @override
  _IntroductionState createState() => _IntroductionState();
}

class _IntroductionState extends State<Introduction> {

  int _currentPage = 0;

  final PageController _pageController = PageController(
    initialPage: 0,
  );

  _onPageChanged (int index) {
    setState(() {
      _currentPage = index;
    });
  }

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
        child: Column(
          children: <Widget>[
            SizedBox(height: 60.0,),
            Expanded(
              child: Stack(
                alignment: AlignmentDirectional.bottomCenter,
                children: <Widget>[
                  PageView.builder(
                    scrollDirection: Axis.horizontal,
                    controller: _pageController,
                    onPageChanged: _onPageChanged,
                    itemCount: slideList.length,
                    itemBuilder: (context, index) => SlideItem(index),
                  ),
                ] ,
              ),
            ),
            SizedBox(height: 20.0,),
            Stack(
              alignment: AlignmentDirectional.topStart,
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(bottom: 35.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      for (int i = 0; i < slideList.length; i++)
                        if (i == _currentPage)
                          SlideDots(isActive: true)
                        else
                          SlideDots(isActive: false)
                    ],
                  ),
                ),
              ],
            ),
            Column(
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    RaisedButton(
                      color: Colors.indigo,
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(30.0, 10.0, 30.0, 10.0),
                        child: Text(
                          'Return to Home',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16.0,
                          ),
                        ),
                      ),
                      onPressed: () => Navigator.pop(context),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 20.0,),
          ],
        ),
      ),
    );
  }
}
