import 'dart:async';
import 'package:boilerplate/constants/font_family.dart';
import 'package:boilerplate/data/sharedpref/constants/preferences.dart';
import 'package:boilerplate/utils/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    startTimer();
  }

  @override
  Widget build(BuildContext context) {

    return Material(color: Colors.black,
      child: Column(children: [
        SizedBox(height: 50,),
            Text('CHÂTEAU ROYAL DE',style: TextStyle(fontFamily: 'Morganite',fontWeight: FontWeight.w100,fontSize: 94,color: Colors.white)),
            Text('Montargis',style: TextStyle(fontFamily: 'Morganite',fontWeight: FontWeight.w800,fontSize: 94,color: Colors.white),),

        Row(mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Flexible(child: Image.asset('assets/images/ville.png')),
          ],
        ),

        MaterialButton(minWidth: 280,onPressed: (){},color: Colors.black,shape: RoundedRectangleBorder(side: BorderSide(color: Colors.white,),borderRadius: BorderRadius.circular(8)),child: Text('Réserver une visite',style: DefaultFont.bold.copyWith(fontSize: 11)),),
            MaterialButton(minWidth: 280,onPressed: (){      Navigator.of(context).pushReplacementNamed(Routes.home);
            },color: Color(0xFFBF9B2E),shape: RoundedRectangleBorder(side: BorderSide(color: Color(0xFFBF9B2E),),borderRadius: BorderRadius.circular(8)),child: Text('visite libre',style: DefaultFont.bold.copyWith(fontSize: 11),),)


          ],),

    );
  }

  startTimer() {
    var _duration = Duration(milliseconds: 99999999);
    return Timer(_duration, navigate);
  }

  navigate() async {

    if (true)  {
      Navigator.of(context).pushReplacementNamed(Routes.home);
    }
  }
}
