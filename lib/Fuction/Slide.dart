import 'package:clothes_store/Fuction/slideItems.dart';
import 'package:flutter/material.dart';

class Slide extends StatelessWidget {
  final int index;
  Slide(this.index);
  @override
  Widget build(BuildContext context) {
   double height= MediaQuery.of(context).size.height;
   double scaleHeight=height/100;
  double width=  MediaQuery.of(context).size.width;
  double scaleWidth=width/100;
    double text=MediaQuery.of(context).textScaleFactor;
    double scaleText=text/100;
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Spacer(),
        Center(child: Image.asset(slideList[index].image)),
        Padding(
          padding: const EdgeInsets.only(top:30.0),
          child: Text(slideList[index].title,style: TextStyle(color: Colors.blue,
              fontWeight: FontWeight.bold,
              fontSize: scaleText*2000)),
        ),
        Padding(
          padding: const EdgeInsets.only(top:30.0, left: 7.0,right: 7),
          child: Text(slideList[index].text,textAlign: TextAlign.center,),
        )
      ],
    );
  }
}
