import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:brain_tumor/generated/l10n.dart';
import 'package:brain_tumor/screens/Login_SignUp.dart/login.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Sign_Up extends StatefulWidget {
  const Sign_Up({super.key});

  @override
  State<Sign_Up> createState() => _Sign_UpState();
}

class _Sign_UpState extends State<Sign_Up> {
  bool PasswordSecured = true;
  bool ConfirmPasswordSecured = true;
  // creating a key for form validation
  GlobalKey<FormState> formstate = GlobalKey();

  TextEditingController fullName = TextEditingController();
  TextEditingController emailAddress = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController confirmPassword = TextEditingController();

  //________firebaseStore to store details about users
  Future addUserDetails(String fullName, String email)async{
    await FirebaseFirestore.instance.collection("users").add({
      "name": fullName,
      "email": email
    });

  }
  //____________ fetch the user's first name
  Future<String?> getFullName(String email) async {
    final querySnapshot = await FirebaseFirestore.instance
        .collection("users")
        .where("email", isEqualTo: email)
        .get();

    if (querySnapshot.docs.isNotEmpty) {
      return querySnapshot.docs.first.data()['fullName'] as String?;
    } else {
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Stack(
            children: [
              Container(
                height: MediaQuery.of(context).size.height * (180 / 814),
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        // begin: Alignment.topCenter,
                        // end: Alignment.bottomCenter,
                        colors: [
                      Color(0xFF1B2B4D),
                      Color(0xFF004F9A),
                    ])),
                child: Padding(
                  padding: const EdgeInsets.all(15),
                  child: Align(
                    alignment: Alignment.topCenter,
                    child: Text(
                      "Sign Up",
                      style: GoogleFonts.inter(
                          fontSize: 40,
                          fontWeight: FontWeight.w900,
                          color: Colors.white),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 106.92),
                child: Container(
                  height: MediaQuery.of(context).size.height * (700 / 814),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius:
                          BorderRadius.only(topLeft: Radius.circular(70))),
                  child: Form(
                    key: formstate,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                            left: 40,
                            right: 40,
                          ),
                          child: Material(
                            elevation: 9.0,
                            shadowColor: Colors.black,
                            child: TextFormField(
                                controller: fullName,
                                cursorColor: Color(0xFF2F80ED),
                                //this mode to make the error apeare untill the user wirte it correct
                                autovalidateMode:
                                    AutovalidateMode.onUserInteraction,
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  filled: true,
                                  fillColor: Colors.white,
                                  hintText: S.of(context).FullName,
                                  hintStyle: GoogleFonts.workSans(
                                      color: Color(0xFF333333)
                                          .withOpacity(60 / 100),
                                      fontSize: 17,
                                      fontWeight: FontWeight.w400),
                                ),
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return S.of(context).EmptyName;
                                  }
                                }),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                            left: 40,
                            right: 40,
                          ),
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
                                  hintText: S.of(context).emailAddress,
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
                        Padding(
                          padding: const EdgeInsets.only(
                            left: 40,
                            right: 40,
                          ),
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
                                  hintText: S.of(context).password,
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
                                    color:
                                        Color(0xFF333333).withOpacity(60 / 100),
                                  )),
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return S.of(context).EmptyPassword;
                                }
                                if (value.length < 8) {
                                  return S.of(context).weak;
                                }
                              },
                            ),
                          ),
                        ),
                        //Confirm Password
                        Padding(
                          padding: const EdgeInsets.only(
                            left: 40,
                            right: 40,
                          ),
                          child: Material(
                            elevation: 9.0,
                            shadowColor: Colors.black,
                            child: TextFormField(
                              controller: confirmPassword,
                              obscureText: ConfirmPasswordSecured,
                              cursorColor: Color(0xFF2F80ED),
                              //this mode to make the error apeare untill the user wirte it correct
                              autovalidateMode:
                                  AutovalidateMode.onUserInteraction,
                              decoration: InputDecoration(
                                  border: InputBorder.none,
                                  filled: true,
                                  fillColor: Colors.white,
                                  hintText: S.of(context).ConfirmPassword,
                                  hintStyle: GoogleFonts.workSans(
                                      color: Color(0xFF333333)
                                          .withOpacity(60 / 100),
                                      fontSize: 17,
                                      fontWeight: FontWeight.w400),
                                  suffixIcon: IconButton(
                                    onPressed: () {
                                      setState(() {
                                        ConfirmPasswordSecured =
                                            !ConfirmPasswordSecured;
                                      });
                                    },
                                    icon: ConfirmPasswordSecured
                                        ? Icon(Icons.visibility_off)
                                        : Icon(Icons.visibility),
                                    color:
                                        Color(0xFF333333).withOpacity(60 / 100),
                                  )),
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return S.of(context).EmptyPassword;
                                }
                                if (confirmPassword.text != password.text) {
                                  return S.of(context).matchPassword;
                                }
                              },
                            ),
                          ),
                        ),
                        // SizedBox(
                        //   height: 30,
                        // ),
                        InkWell(
                          onTap: () async {
                            //______________ if the signup succeeded the congratulation appears
                            if (formstate.currentState!.validate()) {
                              try {
                                final credential = await FirebaseAuth.instance
                                    .createUserWithEmailAndPassword(
                                  email: emailAddress.text,
                                  password: password.text,
                                );
                                addUserDetails(fullName.text, emailAddress.text);
                                
                                FirebaseAuth.instance.currentUser!
                                    .sendEmailVerification();
                                showDialog(
                                  barrierDismissible: false,
                                  context: context,
                                  builder: (context) => AlertDialog(
                                    backgroundColor: Colors.white,
                                    icon: Image.asset('assets/ballons.png'),
                                    title: Text(
                                      S.of(context).Congratulations,
                                      textAlign: TextAlign.center,
                                      style: GoogleFonts.inter(
                                        color: Colors.black,
                                        fontSize: 24,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                    content: Text(
                                      textAlign: TextAlign.center,
                                      S.of(context).AccountHasBeenCreated,
                                      style: GoogleFonts.inter(
                                        color: Colors.black,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                    contentPadding:
                                        EdgeInsets.only(bottom: 50, top: 15),
                                    actions: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          TextButton(
                                            onPressed: () {
                                              Navigator.push(
                                                context,
                                                MaterialPageRoute<void>(
                                                  builder:
                                                      (BuildContext context) =>
                                                          login_screen(),
                                                ),
                                              );
                                            },
                                            child: Text(
                                              S.of(context).LoginNow,
                                              style: GoogleFonts.inter(
                                                color: Color(0xFF2F80ED),
                                                fontSize: 16,
                                                fontWeight: FontWeight.w400,
                                              ),
                                            ),
                                          ),
                                          Icon(
                                            Icons.arrow_right_alt_outlined,
                                            color: Color(0xFF2F80ED),
                                          )
                                        ],
                                      )
                                    ],
                                  ),
                                );

                                // if not succeeded error appears
                              } on FirebaseAuthException catch (e) {
                                if (e.code == 'weak-password') {
                                  print('The password provided is too weak.');
                                } else if (e.code == 'email-already-in-use') {
                                  print(
                                      'The account already exists for that email.');
                                  AwesomeDialog(
                                    context: context,
                                    dialogType: DialogType.error,
                                    animType: AnimType.rightSlide,
                                    title: S.of(context).Error,
                                    desc: S.of(context).AccExist,
                                  ).show();
                                }
                              } catch (e) {
                                print(e);
                              }
                            }
                          },
                          child: Container(
                            height: 65,
                            width:
                                MediaQuery.of(context).size.width * (343 / 366),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                gradient: LinearGradient(colors: [
                                  Color(0xFF1B2B4D),
                                  Color(0xFF004F9A),
                                ])),
                            child: Center(
                              child: Text(
                                S.of(context).signUp,
                                style: GoogleFonts.inter(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w800,
                                    color: Colors.white),
                              ),
                            ),
                          ),
                        ),
                        // SizedBox(
                        //   height: 30,
                        // ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              S.of(context).haveAccount,
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
                                          login_screen(),
                                    ),
                                  );
                                },
                                child: Text(S.of(context).login,
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
            ],
          ),
        ),
      ),
    );
  }
}
