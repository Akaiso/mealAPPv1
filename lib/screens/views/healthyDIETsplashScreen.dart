import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import 'healthyDietCarousel.dart';



class SplashScreen extends StatefulWidget {
  const SplashScreen({Key key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}


class _SplashScreenState extends State<SplashScreen> {



  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(Duration(seconds: 3000), (){Get.to(()=>Carousel());});

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purpleAccent,
      body: Center(
        child: Container(
          child: Text("HEALTHY.DIET",style: TextStyle(color: Colors.white70,fontSize: 30,fontWeight: FontWeight.bold),),
        ),
      ),
    );
  }
}
