import 'dart:async';
import 'package:bogenia/webview_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:hexcolor/hexcolor.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final spinKit = SpinKitFadingCircle(
    itemBuilder: (context, index) {
      return DecoratedBox(
        decoration: BoxDecoration(
            color: index.isEven ? Colors.white : HexColor('#471337'),
            shape: BoxShape.circle),
      );
    },
  );

  @override
  void initState() {
    super.initState();

    Timer(const Duration(seconds: 5), () => goToHomeScreen());
  }

  goToHomeScreen() {
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (BuildContext context) => const WebViewPage(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Container(
            color: HexColor('#F8EDF5'),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(
                child: Image.asset(
                  'assets/images/logo.png',
                  width: 200,
                ),
              ),
              SizedBox(
                height: h * 0.1,
              ),
              spinKit,
            ],
          ),
        ],
      ),
    );
  }
}
