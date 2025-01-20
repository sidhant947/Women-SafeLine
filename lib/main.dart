import 'package:flutter/material.dart';
import 'frontend/introscreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        fontFamily: "Lufga",
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      title: "Women Safeline",
      home: Splash(),
    );
  }
}

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    Future.delayed(
      Duration(seconds: 4),
      () {
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => IntroScreen()));
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          alignment: Alignment.bottomCenter,
          padding: EdgeInsets.only(bottom: 250),
          color: Color.fromRGBO(255, 121, 199, 1),
          child: Text(
            "Safeline",
            style: TextStyle(
                fontSize: 40, color: Colors.white, fontStyle: FontStyle.italic),
          ),
        ),
      ),
    );
  }
}
