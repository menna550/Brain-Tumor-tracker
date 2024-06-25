import 'package:brain_tumor/Drawer/drawer.dart';
import 'package:brain_tumor/screens/Login_SignUp.dart/login.dart';
import 'package:brain_tumor/screens/OnBordingScreen/onbording_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

class splash_screen extends StatefulWidget {
  const splash_screen({super.key});

  @override
  State<splash_screen> createState() => _splash_screenState();
}

class _splash_screenState extends State<splash_screen> {
  @override
  void initState() {
    super.initState();
    // Navigate to the next screen after 3 seconds
    Future.delayed(Duration(seconds: 5), () {
      navigateToNextScreen();
    });
  }

  // This method checks the shared preferences and decides which screen to navigate to
  void navigateToNextScreen() async {
    // Get the instance of shared preferences
    SharedPreferences prefs = await SharedPreferences.getInstance();
    // Get the value of 'seen' key, which is a boolean
    // If the key does not exist, return false as a default value
    bool seen = prefs.getBool('seen') ?? false;
    // If the user has seen the onboarding screen, go to the home screen
    if (seen) {
      //if user login && verified go to home , else gp to login
      FirebaseAuth.instance.currentUser != null && FirebaseAuth.instance.currentUser!.emailVerified ?
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => drawer()),
      ): Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => login_screen()),
      );
    } else {
      // Otherwise, go to the onboarding screen
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => onbording_screen()),
      );
    }
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
              Color(0xFF1B2B4D),
              Color(0xFF004F9A),
            ])),
          child: Scaffold(
                backgroundColor: Colors.transparent,
                body: Stack(
          children: [
            Positioned(
              top: -268,
              left: -229,
              child: Container(
                height: 409,
                width: 409,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(409),
                  color: Color(0xFFAAC0E3),
                ),
              ),
            ),
            Positioned(
              top: 632,
              left: 175,
              child: Container(
                height: 268,
                width: 268,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(268),
                  color: Color(0xFFAAC0E3),
                ),
              ),
            ),
            Positioned(
                top: 80.0,
                left: 22.42,
                child:Image.asset("assets/splashBrain.png"),),
            Positioned(
                top: 150.0 + 255.73 + 10,
                left: 34.0,
                child: RichText(
                  text: TextSpan(children: [
                    TextSpan(
                      text: "B R A I N\n",
                      style: GoogleFonts.inter(
                          fontSize: 26,
                          fontWeight: FontWeight.w900,
                          color: Color(0xFF7A9FD7)),
                    ),
                    TextSpan(
                      text: "T U M O R T R C K E R",
                      style: GoogleFonts.inter(
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                          color: Color(0xFFF1FBFF)),
                    )
                  ]),
                ))
          ],
                ),
              ),
        ));
  }
}
