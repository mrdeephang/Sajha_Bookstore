import 'package:flutter/material.dart';
import 'package:sajhabackup/Boardingpages/intro1.dart';
import 'package:sajhabackup/Boardingpages/intro2.dart';
import 'package:sajhabackup/Boardingpages/intro3.dart';
import 'package:sajhabackup/pages/login.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class onboardingscreen extends StatefulWidget {
  const onboardingscreen({Key? key}) : super(key: key);

  @override
  State<onboardingscreen> createState() => _onboardingscreenState();
}

class _onboardingscreenState extends State<onboardingscreen> {
  PageController _controller = PageController();
  bool onLastPage = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            controller: _controller,
            onPageChanged: (index) {
              setState(() {
                onLastPage = (index == 2);
              });
            },
            children: [
              intro1(),
              intro2(),
              intro3(),
            ],
          ),
          //dot indicators
          Container(
            alignment: Alignment(0, 0.75),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GestureDetector(
                  onTap: () {
                    _controller.jumpToPage(2);
                  },
                  child: Text(''),
                ),
                //dotindicator
                SmoothPageIndicator(controller: _controller, count: 3),

                //nextt or done
                onLastPage
                    ? GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) {
                                return loginscreen();
                              },
                            ),
                          );
                        },
                        child: Text('Done'),
                      )
                    : GestureDetector(
                        onTap: () {
                          _controller.nextPage(
                            duration: Duration(milliseconds: 500),
                            curve: Curves.easeIn,
                          );
                        },
                        child: Text(''),
                      ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
