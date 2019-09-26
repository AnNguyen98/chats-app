import 'package:chats_app/constants.dart';
import 'package:chats_app/models/on_boarding.dart';
import 'package:chats_app/screens/sign_in_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

class OnboardingScreen extends StatefulWidget {
  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  PageController pageController;
  List<Color> colorsPageControl = [Colors.white, Colors.grey, Colors.grey];
  List<OnBoarding> onBoardings = [
    OnBoarding(
      title: 'Send Unlimited Messages',
      message:
          'After you have registered your number with Signal, you can start communicating privately with other Signal users.',
    ),
    OnBoarding(
      title: 'Enjoy Group Chat',
      message:
          'Encrypted Business Communication Software with Multiple Instant Messaging Features. Test Brosix\'s Expansive Functionality.',
    ),
    OnBoarding(
      title: 'Share Audio, Video & Photo',
      message:
          'Real-time stats. See which fans are listening to your tracks the most and where your top fans are, all in real-time.',
    ),
  ];
  String titleNextButton = 'Next';
  String titleOnBoarding = '';
  String messageOnBoarding = '';
  bool isDisableSkipButton = false;
  @override
  void initState() {
    super.initState();
    pageController = PageController(initialPage: 0);
    titleOnBoarding = onBoardings[0].title;
    messageOnBoarding = onBoardings[0].message;
  }

  void _handleSkipButton() {
    _signInScreen();
  }

  void _signInScreen() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => SignInScreen(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          PageView(
            controller: pageController,
            onPageChanged: (index) {
              setState(() {
                for (int i = 0; i < 3; i++) {
                  if (i == index) {
                    colorsPageControl[i] = Colors.white;
                  } else {
                    colorsPageControl[i] = Colors.grey;
                  }
                }
                if (index < 2) {
                  titleNextButton = 'Next';
                  isDisableSkipButton = false;
                } else {
                  titleNextButton = 'Get Started';
                  isDisableSkipButton = true;
                }
                titleOnBoarding = onBoardings[index].title;
                messageOnBoarding = onBoardings[index].message;
              });
            },
            children: <Widget>[
              Container(
                child: Image(
                  fit: BoxFit.fill,
                  image: AssetImage('images/on_boarding_1.png'),
                ),
              ),
              Container(
                child: Image(
                  fit: BoxFit.fill,
                  image: AssetImage('images/on_boarding_2.png'),
                ),
              ),
              Container(
                child: Image(
                  fit: BoxFit.fill,
                  image: AssetImage('images/on_boarding_3.png'),
                ),
              ),
            ],
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              padding: EdgeInsets.only(top: 40, left: 24, right: 24),
              width: double.infinity,
              height: 285,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(50),
                  topRight: Radius.circular(50),
                ),
                gradient: kGradientGreen,
              ),
              child: Column(
                children: <Widget>[
                  Text(
                    titleOnBoarding,
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                      fontFamily: 'SourceSansPro',
                    ),
                  ),
                  SizedBox(
                    height: 17,
                  ),
                  Text(
                    messageOnBoarding,
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.white,
                      fontFamily: 'SourceSansPro',
                    ),
                    textAlign: TextAlign.center,
                  ),
                  Spacer(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      MaterialButton(
                        minWidth: 110,
                        onPressed:
                            isDisableSkipButton ? null : _handleSkipButton,
                        child: Text(
                          'Skip',
                          style: TextStyle(
                              color: isDisableSkipButton
                                  ? Colors.black.withOpacity(0)
                                  : Colors.white,
                              fontSize: 14),
                        ),
                      ),
                      Container(
                        height: 8,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: <Widget>[
                            CircleAvatar(
                              radius: 8,
                              backgroundColor: colorsPageControl[0],
                            ),
                            CircleAvatar(
                              radius: 8,
                              backgroundColor: colorsPageControl[1],
                            ),
                            CircleAvatar(
                              radius: 8,
                              backgroundColor: colorsPageControl[2],
                            ),
                          ],
                        ),
                      ),
                      MaterialButton(
                        minWidth: 110,
                        onPressed: () {
                          int currentPage = pageController.page.toInt();
                          setState(() {
                            if (currentPage < 2) {
                              pageController.animateToPage(
                                currentPage + 1,
                                duration: Duration(seconds: 1),
                                curve: Curves.fastOutSlowIn,
                              );
                            } else {
                              _signInScreen();
                            }
                          });
                        },
                        child: Text(
                          titleNextButton,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                          ),
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 32,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
