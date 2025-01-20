import 'package:flutter/material.dart';
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
    return SafeArea(
      child: Scaffold(
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
          child: isLast
              ? Center(
                  child: GestureDetector(
                      onTap: () {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => HomeScreen()));
                      },
                      child: Container(
                          padding: EdgeInsets.all(20),
                          decoration: BoxDecoration(
                              color: Colors.pinkAccent,
                              borderRadius: BorderRadius.circular(20)),
                          child: Text("Get Started"))))
              : Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextButton(
                      onPressed: () => _controller.jumpToPage(2),
                      child: Text("Skip"),
                    ),
                    // SmoothPageIndicator(controller: _controller, count: 3,),
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.pinkAccent,
                          shape: CircleBorder(),
                          padding: EdgeInsets.all(25),
                        ),
                        onPressed: () => _controller.nextPage(
                            duration: Duration(milliseconds: 500),
                            curve: Curves.easeIn),
                        child: Icon(
                          Icons.arrow_forward_ios,
                          color: Colors.white,
                        ))
                  ],
                ),
        ),
      ),
    );
  }
}
