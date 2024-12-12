import 'dart:async';
import 'package:flutter/material.dart';
import 'package:aplikasi_makanan/main.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 3), () {
      // Ubah isFirstLaunch menjadi false
      MyApp.isFirstLaunch = false;
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => MyAppMain()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green,
      body: Center(
        child: Image.asset('assets/Logo.jpeg', width: 200, height: 200),
      ),
    );
  }
}
