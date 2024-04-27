import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter/services.dart';
import 'package:appstore_info/appstore_info.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool isLoading = false;

  set loadingState(bool value) {
    setState(() {
      isLoading = value;
    });
  }

  final _appstoreInfoPlugin = AppstoreInfo();

  // Function to open the App Store inside the app
  Future<void> openAppStoreInside() async {
    try {
      loadingState = true; // Set the loading state to true
      // Open the App Store with the specified app ID
      // Example: Instagram app ID is 389801252
      // URL: https://apps.apple.com/in/app/instagram/id389801252
      await _appstoreInfoPlugin.presentAppStore(appID: '389801252');
      loadingState = false; // Set the loading state back to false
    } on PlatformException {
      loadingState = false; // Set the loading state back to false in case of an exception
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('App Store Info Example'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (isLoading)
                const CupertinoActivityIndicator()
              else
                CupertinoButton(
                  color: CupertinoColors.activeBlue,
                  onPressed: openAppStoreInside,
                  child: const Text("Open App Store"),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
