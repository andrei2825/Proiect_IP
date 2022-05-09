import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class SplashScreen extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xff848B91),
        body: Container(
          padding: const EdgeInsets.all(25),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [ Flexible(
              child: Image.asset('assets/logo_panda.png'),
            ),
              const SpinKitFadingCircle(
                color: Colors.white,
                size: 30,
              )
            ],
          ),
        ),
      ),
    );
  }
}
