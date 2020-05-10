import 'package:flutter/material.dart';
import 'package:utpappdev/shared/committee_card.dart';

class Committee extends StatelessWidget {
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
                    'Committee',
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
              Column(
                children: <Widget>[
                  CommitteeCard(
                    imageUrl: 'https://media-exp1.licdn.com/dms/image/C5103AQFh4WWp7JBcrg/profile-displayphoto-shrink_200_200/0?e=1594857600&v=beta&t=Bned33Au3NQwTgX236sx28khL4fcTcL75intGBpPxhE',
                    name: 'Muhammad Fathy Rashad',
                    position: 'President',
                    websiteUrl: 'https://www.mfrashad.com',
                    course: 'Computer Engineering',
                    email: 'muhammad.fathy_25547@utp.edu.my',
                  ),

                  CommitteeCard(
                    imageUrl: 'https://scontent.fpen1-1.fna.fbcdn.net/v/t1.0-9/66793983_2141865742592518_7183641593528713216_n.jpg?_nc_cat=100&_nc_sid=09cbfe&_nc_oc=AQmwJ_PVNRd2jY55FAAKB7UqFrYw1RxxcuMClgEdXhg2rp7MrLLZYtl3ULAYWkT8ClQ&_nc_ht=scontent.fpen1-1.fna&oh=7803cc78784b427b3ed03c3b67ee70ea&oe=5EDE4081',
                    name: 'Timmothy Ling',
                    position: 'Vice President',
                    websiteUrl: 'https://www.facebook.com/timothy.jithuong',
                    course: 'Computer Engineering',
                    email: 'timothy_17008605@utp.edu.my',
                  ),

                  CommitteeCard(
                    imageUrl: 'https://media-exp1.licdn.com/dms/image/C5103AQHDwmn_y7AcCQ/profile-displayphoto-shrink_200_200/0?e=1594857600&v=beta&t=lX6lY0J52gU_z3xlKr1OEWH2tAjjW8JGOPf39D-jnVQ',
                    name: 'Tan Li Tung',
                    position: 'Secretary',
                    websiteUrl: 'https://tanlitung388.github.io/tanlitung',
                    course: 'Electrical & Electronics Engineering',
                    email: 'li_17002803@utp.edu.my',
                  ),


                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
