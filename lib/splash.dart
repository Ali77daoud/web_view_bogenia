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

    Timer(const Duration(seconds: 3), () => goToHomeScreen());
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
    return Container(
      color: HexColor('#A86A96'),
      child: SafeArea(
        child: Scaffold(
            body: Container(
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/images/bg2.png'),
                  fit: BoxFit.cover)),
        )),
      ),
    );
  }
}
