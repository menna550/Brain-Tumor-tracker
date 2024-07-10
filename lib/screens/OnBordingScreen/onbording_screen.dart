import 'package:brain_tumor/screens/Login_SignUp.dart/login.dart';
import 'package:brain_tumor/screens/OnBordingScreen/page1.dart';
import 'package:brain_tumor/screens/OnBordingScreen/page2.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class onbording_screen extends StatefulWidget {
  onbording_screen({super.key});

  @override
  State<onbording_screen> createState() => _onbording_screenState();
}

class _onbording_screenState extends State<onbording_screen> {
  //_________________this for Navigation
  @override
  void initState() {
    super.initState();
    // Set the 'seen' key to true in the shared preferences
    // This means that the user has seen the onboarding screen
    setSeen();
  }

  // This method sets the 'seen' key to true in the shared preferences
  void setSeen() async {
    // Get the instance of shared preferences
    SharedPreferences prefs = await SharedPreferences.getInstance();
    // Set the boolean value of 'seen' key to true
    prefs.setBool('seen', true);
  }
  //_________________________
  final _controller = PageController(initialPage: 0);
  int currenPage = 0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
              // Color(0xFF1B2B4D),
              // Color(0xFF004F9A),
              Color(0xFF3D1C65),
              Color(0xFF72519A),
            ])),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: Center(
            child: Container(
              height: MediaQuery.of(context).size.height * (598 / 800),
              width: MediaQuery.of(context).size.width * (308 / 360),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10.0)),
              child: Column(
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height * (330 / 599),
                    child: PageView(
                      controller: _controller,
                      onPageChanged: (value) {
                        setState(() {
                          currenPage = value;
                        });
                      },
                      children: const [page1(), page2()],
                    ),
                  ),
                  SmoothPageIndicator(
                    controller: _controller, // PageController
                    count: 2,
                    effect: const ExpandingDotsEffect(
                        dotHeight: 10,
                        dotWidth: 10,
                        activeDotColor: Color(0xFF3D1C65),
                        dotColor: Color(
                          0xFF8FA1E6,
                        )),
                  ),
                  const SizedBox(
                    height: 30,
                  ),

                  //________________________________buttons
                  currenPage == 0
                      ? InkWell(
                          onTap: () {
                            _controller.nextPage(
                                duration: Duration(microseconds: 400),
                                curve: Curves.easeInOut);
                          },
                          child: Container(
                            width:
                                MediaQuery.of(context).size.width * (154 / 360),
                            height:
                                MediaQuery.of(context).size.height * (44 / 800),
                            decoration: BoxDecoration(
                                color: Color(0xFF3D1C65),
                                borderRadius: BorderRadius.circular(45)),
                            child: Center(
                              child: Text(
                                "Next",
                                style: GoogleFonts.inter(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w900,
                                    color: Colors.white),
                              ),
                            ),
                          ),
                        )
                      : InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute<void>(
                                builder: (BuildContext context) =>
                                    const login_screen(),
                              ),
                            );
                          },
                          child: Container(
                            width:
                                MediaQuery.of(context).size.width * (154 / 360),
                            height:
                                MediaQuery.of(context).size.height * (44 / 800),
                            decoration: BoxDecoration(
                                color: Color(0xFF3D1C65),
                                borderRadius: BorderRadius.circular(45)),
                            child: Center(
                              child: Text(
                                "Start",
                                style: GoogleFonts.inter(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w900,
                                    color: Colors.white),
                              ),
                            ),
                          ),
                        )
                  //_______________________________
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
