import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewPage extends StatefulWidget {
  const WebViewPage({Key? key}) : super(key: key);

  @override
  State<WebViewPage> createState() => _WebViewPageState();
}

class _WebViewPageState extends State<WebViewPage> {
  late WebViewController controller;
  bool isProgress = true;

  final spinKit = SpinKitFadingCircle(
    itemBuilder: (context, index) {
      return DecoratedBox(
        decoration: BoxDecoration(
            color: index.isEven
                ? const Color.fromARGB(255, 139, 139, 139)
                : HexColor('#471337'),
            shape: BoxShape.circle),
      );
    },
  );

  @override
  void initState() {
    super.initState();
    if (Platform.isAndroid) {
      WebView.platform = SurfaceAndroidWebView();
    } else if (Platform.isIOS) {}
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        if (await controller.canGoBack()) {
          controller.goBack();
          return false;
        } else {
          return true;
        }
      },
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: const Text('Bogenia'),
            backgroundColor: HexColor('#471337'),
            actions: [
              //////// back
              IconButton(
                  onPressed: () async {
                    if (await controller.canGoBack()) {
                      controller.goBack();
                    }
                  },
                  icon: const Icon(Icons.arrow_back)),
              /////// refreshe
              IconButton(
                  onPressed: () {
                    controller.reload();
                  },
                  icon: const Icon(Icons.refresh))
            ],
          ),
          body: Stack(
            children: [
              WebView(
                // if I use http there is some config to add ....
                initialUrl: 'https://bogenia.com.sa',
                javascriptMode: JavascriptMode.unrestricted,
                onWebViewCreated: (controller) {
                  this.controller = controller;
                },
                onProgress: (int progress) {
                  setState(() {
                    isProgress = true;
                  });
                  print('WebView is loading (progress : $progress%)');
                },
                onPageFinished: (string) {
                  setState(() {
                    isProgress = false;
                  });
                  print('page finished');
                },
              ),
              isProgress
                  ? Center(
                      child: spinKit,
                    )
                  : Stack(),
            ],
          ),
        ),
      ),
    );
  }
}
