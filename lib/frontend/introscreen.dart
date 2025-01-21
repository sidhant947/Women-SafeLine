import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'homescreen.dart';

class IntroScreen extends StatefulWidget {
  const IntroScreen({super.key});

  @override
  State<IntroScreen> createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  final _controller = PageController();
  bool isLast = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(bottom: 100),
        child: PageView(
          onPageChanged: (value) {
            setState(() {
              isLast = value == 2;
            });
          },
          controller: _controller,
          children: [
            Container(
              color: Colors.amber,
            ),
            Container(
              color: Colors.blue,
            ),
            Container(
              color: Colors.cyan,
            ),
          ],
        ),
      ),
      bottomSheet: Container(
        height: 100,
        padding: EdgeInsets.all(10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SmoothPageIndicator(
              controller: _controller, // PageController
              count: 3,
              effect: ExpandingDotsEffect(
                  dotColor: Colors.pinkAccent,
                  activeDotColor: Colors.pink.shade100),
            ),
            // SmoothPageIndicator(controller: _controller, count: 3,),
            if (isLast)
              GestureDetector(
                  onTap: () {
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context) => HomeScreen()));
                  },
                  child: Container(
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          color: Colors.pinkAccent,
                          borderRadius: BorderRadius.circular(20)),
                      child: Text(
                        "Get Started",
                        style: TextStyle(color: Colors.white),
                      )))
          ],
        ),
      ),
    );
  }
}
