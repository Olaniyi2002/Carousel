import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'Slide.dart';
import 'slideItems.dart';
import 'slidedots.dart';

class Carousel  extends StatefulWidget {
  const Carousel ({Key key}) : super(key: key);

  @override
  _CarouselState createState() => _CarouselState();
}

class _CarouselState extends State<Carousel > {
  int _currentPage=0;
final PageController _pageController= PageController(
    initialPage: 0
);

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer.periodic(Duration(seconds: 5), (Timer timer) {
      if(_currentPage<2){
        _currentPage++;
      }
      else{
        _currentPage=0;
      }
      _pageController.animateToPage(_currentPage,
          duration: Duration(milliseconds: 300),
          curve: Curves.easeIn);
    });
  }

  @override
  dispose() async {
    super.dispose();
    _pageController.dispose();
  }
  _onPageChange(int index){
    setState(() {
      _currentPage=index;
    });
  }

  Widget build(BuildContext context) {
    double height= MediaQuery.of(context).size.height;
    double scaleHeight=height/100;
    double width=  MediaQuery.of(context).size.width;
    double scaleWidth=width/100;
    double text=MediaQuery.of(context).textScaleFactor;
    double scaleText=text/100;
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [

          Expanded(
            flex: 5,
            child: PageView.builder(
              scrollDirection: Axis.horizontal,
              onPageChanged: _onPageChange,
              controller:_pageController ,
              itemCount:slideList.length,
                 itemBuilder: (ctx,i)=>Slide(i)),
          ),
          Expanded(
            flex: 2,
              child: Column(
               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
               children: [
               Spacer(),
               Spacer(),
                Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  for (int i = 0; i <3; i++)
                  if (i == _currentPage)
                    SlideDots(true)
                  else
                    SlideDots(false)

                ],
              ),
                Spacer(),
                Spacer(),
                FlatButton(onPressed: (){},
                  child: Text("Get Started",style:TextStyle(color: Colors.white),),
                  color: Colors.blue,
                ),
                Spacer(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                  Text("have an account ?"),
                  SizedBox(width: scaleWidth*2,),
                  GestureDetector( onTap:(){},child: Text("Login",
                    style: TextStyle(color: Colors.blue,fontWeight: FontWeight.bold,
                    ),)),
                  ],
                )
            ],
          )),

        ],
      ),
    );
  }
}
