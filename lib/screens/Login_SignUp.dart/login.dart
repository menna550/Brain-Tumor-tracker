import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:brain_tumor/Drawer/drawer.dart';
import 'package:brain_tumor/Drawer/home.dart';
import 'package:brain_tumor/generated/l10n.dart';
import 'package:brain_tumor/screens/Login_SignUp.dart/sign_up.dart';
import 'package:brain_tumor/screens/forgetPassScreen/forgetPass.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';

class login_screen extends StatefulWidget {
  const login_screen({super.key});

  @override
  State<login_screen> createState() => _login_screenState();
}

class _login_screenState extends State<login_screen> {
  bool PasswordSecured = true;

  // creating a key for form validation
  GlobalKey<FormState> formstate = GlobalKey();

  TextEditingController emailAddress = TextEditingController();
  TextEditingController password = TextEditingController();
  //_____________fetch user' first name
  // Future<String?> getFullName(String email) async {
  //   final querySnapshot = await FirebaseFirestore.instance
  //       .collection("users")
  //       .where("email", isEqualTo: email)
  //       .get();

  //   if (querySnapshot.docs.isNotEmpty) {
  //     return querySnapshot.docs.first.data()['fullName'] as String?;
  //   } else {
  //     return null;
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Stack(
            children: [
              Container(
                height: MediaQuery.of(context).size.height * (290 / 814),
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        // begin: Alignment.topCenter,
                        // end: Alignment.bottomCenter,
                        colors: [
                      Color(0xFF1B2B4D),
                      Color(0xFF004F9A),
                    ])),
              ),
              //we add padding istead of Alignment.bottomCenter to solve scrollable issue
              //and make all screen with positioned , fisrt container and second container be scrollable
              Padding(
                padding: const EdgeInsets.only(top: 215.29),
                child: Container(
                  height: MediaQuery.of(context).size.height * (570 / 814),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius:
                          BorderRadius.only(topLeft: Radius.circular(70))),
                  child: Center(
                    // we add center to make the container not only fit the text
                    child: Form(
                      //call globalkey for valiation form
                      key: formstate,
                      child: Column(
                        children: [
                          SizedBox(
                            height: 15,
                          ),
                          Text(
                            "Login",
                            style: GoogleFonts.inter(
                                fontSize: 40,
                                fontWeight: FontWeight.w900,
                                color: Color(0xFF1B2B4D)),
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          //Email Address TextFormField
                          Padding(
                            padding: isArabic
                                ? const EdgeInsets.only(
                                    left: 170,
                                  )
                                : const EdgeInsets.only(
                                    right: 180,
                                  ),
                            child: Text(
                              S.of(context).emailAddress,
                              style: GoogleFonts.workSans(
                                  color: Color(0xFF333333),
                                  fontSize: 17,
                                  fontWeight: FontWeight.w400),
                            ),
                          ),

                          Padding(
                            padding: const EdgeInsets.only(
                                left: 40, right: 40, top: 5),
                            child: Material(
                              elevation: 9.0,
                              shadowColor: Colors.black,
                              child: TextFormField(
                                  controller: emailAddress,
                                  cursorColor: Color(0xFF2F80ED),
                                  //this mode to make the error apeare untill the user wirte it correct
                                  autovalidateMode:
                                      AutovalidateMode.onUserInteraction,
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                    filled: true,
                                    fillColor: Colors.white,
                                    hintText: "abc@gmail.com",
                                    hintStyle: GoogleFonts.workSans(
                                        color: Color(0xFF333333)
                                            .withOpacity(60 / 100),
                                        fontSize: 17,
                                        fontWeight: FontWeight.w400),
                                  ),
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return S.of(context).EmailEmpty;
                                    }
                                    final regex = RegExp(
                                        r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.com$');
                                    if (!regex.hasMatch(value)) {
                                      return S.of(context).ValidEmail;
                                    }
                                  }),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          //password TextFormField
                          Padding(
                            padding: isArabic
                                ? const EdgeInsets.only(left: 250)
                                : const EdgeInsets.only(right: 220),
                            child: Text(
                              S.of(context).password,
                              style: GoogleFonts.workSans(
                                  color: Color(0xFF333333),
                                  fontSize: 17,
                                  fontWeight: FontWeight.w400),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 40, right: 40, top: 5),
                            child: Material(
                              elevation: 9.0,
                              shadowColor: Colors.black,
                              child: TextFormField(
                                controller: password,
                                obscureText: PasswordSecured,
                                cursorColor: Color(0xFF2F80ED),
                                //this mode to make the error apeare untill the user wirte it correct
                                autovalidateMode:
                                    AutovalidateMode.onUserInteraction,
                                decoration: InputDecoration(
                                    border: InputBorder.none,
                                    filled: true,
                                    fillColor: Colors.white,
                                    hintText: "•••••••••••",
                                    hintStyle: GoogleFonts.workSans(
                                        color: Color(0xFF333333)
                                            .withOpacity(60 / 100),
                                        fontSize: 17,
                                        fontWeight: FontWeight.w400),
                                    suffixIcon: IconButton(
                                      onPressed: () {
                                        setState(() {
                                          PasswordSecured = !PasswordSecured;
                                        });
                                      },
                                      icon: PasswordSecured
                                          ? Icon(Icons.visibility_off)
                                          : Icon(Icons.visibility),
                                      color: Color(0xFF333333)
                                          .withOpacity(60 / 100),
                                    )),
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return S.of(context).EmptyPassword;
                                  }
                                },
                              ),
                            ),
                          ),
                          SizedBox(height: 30),
                          //Login button
                          InkWell(
                            onTap: () async {
                              if (formstate.currentState!.validate()) {
                                try {
                                  final credential = await FirebaseAuth.instance
                                      .signInWithEmailAndPassword(
                                          email: emailAddress.text,
                                          password: password.text);
                                  //________________
                                  if (credential.user!.emailVerified) {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute<void>(
                                        builder: (BuildContext context) =>
                                            drawer(),
                                      ),
                                    );
                                  } else {
                                    FirebaseAuth.instance.currentUser!
                                        .sendEmailVerification();
                                    AwesomeDialog(
                                      context: context,
                                      dialogType: DialogType.error,
                                      animType: AnimType.rightSlide,
                                      title: 'Error',
                                      desc:
                                          "check your email to verify your account",
                                    ).show();
                                  }
                                } on FirebaseAuthException catch (e) {
                                  if (e.code == 'user-not-found') {
                                    print('No user found for that email.');
                                    AwesomeDialog(
                                      context: context,
                                      dialogType: DialogType.error,
                                      animType: AnimType.rightSlide,
                                      title: 'Error',
                                      desc: 'No user found for that email',
                                    ).show();
                                  } else if (e.code == 'wrong-password') {
                                    print(
                                        'Wrong password provided for that user.');
                                    AwesomeDialog(
                                      context: context,
                                      dialogType: DialogType.error,
                                      animType: AnimType.rightSlide,
                                      title: 'Error',
                                      desc:
                                          'Wrong password provided for that user',
                                    ).show();
                                  }
                                  AwesomeDialog(
                                    context: context,
                                    dialogType: DialogType.error,
                                    animType: AnimType.rightSlide,
                                    title: 'Error',
                                    desc: 'Invalid email or password',
                                  ).show();
                                }
                              } else
                                (print("not valid"));
                            },
                            child: Container(
                              height: 65,
                              width: MediaQuery.of(context).size.width *
                                  (343 / 366),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  gradient: LinearGradient(colors: [
                                    Color(0xFF1B2B4D),
                                    Color(0xFF004F9A),
                                  ])),
                              child: Center(
                                child: Text(
                                  S.of(context).login,
                                  style: GoogleFonts.inter(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w800,
                                      color: Colors.white),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          //ForgetPassword Button
                          TextButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute<void>(
                                    builder: (BuildContext context) =>
                                        forgetPassScreen(),
                                  ),
                                );
                              },
                              child: Text(S.of(context).forgetPassword,
                                  style: GoogleFonts.inter(
                                    color: Color(0xFF00939B),
                                    fontSize: 15,
                                    fontWeight: FontWeight.w400,
                                  ))),
                          Spacer(),
                          //SignUp button
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                S.of(context).AnyAccount,
                                style: GoogleFonts.inter(
                                  color: Colors.black,
                                  fontSize: 15,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              TextButton(
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute<void>(
                                        builder: (BuildContext context) =>
                                            Sign_Up(),
                                      ),
                                    );
                                  },
                                  child: Text(S.of(context).signUp,
                                      style: GoogleFonts.inter(
                                        color: Color(0xFF00939B),
                                        fontSize: 15,
                                        fontWeight: FontWeight.w400,
                                      )))
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                  top: 16,
                  left: 23,
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
                  )),
              Positioned(
                top: 74,
                left: -4,
                child: Image.asset(
                  "assets/loginBrain.png",
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
