import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:brain_tumor/generated/l10n.dart';
import 'package:brain_tumor/screens/Login_SignUp.dart/login.dart';
import 'package:brain_tumor/screens/forgetPassScreen/verificationCode.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';

class forgetPassScreen extends StatefulWidget {
  const forgetPassScreen({super.key});

  @override
  State<forgetPassScreen> createState() => _forgetPassScreenState();
}

class _forgetPassScreenState extends State<forgetPassScreen> {
  //Create Global key for validation form
  GlobalKey<FormState> formstate = GlobalKey();

  TextEditingController _emailAddress = TextEditingController();
  @override
  void dispose() {
    _emailAddress.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Form(
            key: formstate,
            child: Column(
              children: [
                Align(
                    alignment: Alignment.topLeft,
                    child: IconButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute<void>(
                              builder: (BuildContext context) => login_screen(),
                            ),
                          );
                        },
                        icon: Icon(Icons.arrow_back))),
                Image.asset("assets/illustration.png"),
                SizedBox(
                  height: 30,
                ),
                Text(
                  S.of(context).forgetPassword,
                  style: GoogleFonts.workSans(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  S.of(context).DoNotWorry,
                  textAlign: TextAlign.center,
                  style: GoogleFonts.workSans(
                    fontSize: 15,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                SizedBox(
                  height: 25,
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: TextFormField(
                    controller: _emailAddress,
                    cursorColor: Color(0xFF2F80ED),
                    //this mode to make the error apeare untill the user wirte it correct
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    decoration: InputDecoration(
                      labelText: S.of(context).emailAddress,
                      labelStyle: GoogleFonts.workSans(
                          color: Color(0xFF333333).withOpacity(60 / 100),
                          fontSize: 17,
                          fontWeight: FontWeight.w400),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: BorderSide(
                              color: Color(0xFF333333).withOpacity(60 / 100))),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: BorderSide(
                              color: Color(0xFF333333).withOpacity(60 / 100))),
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return S.of(context).EmailEmpty;
                      }
                      final regex =
                          RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.com$');
                      if (!regex.hasMatch(value)) {
                        return S.of(context).ValidEmail;
                      }
                    },
                  ),
                ),
                SizedBox(
                  height: 40,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 120, right: 120),
                  child: ElevatedButton(
                      onPressed: () async {
                        if (formstate.currentState!.validate()) {
                          try {
                            await FirebaseAuth.instance
                                .sendPasswordResetEmail(
                                    email: _emailAddress.text)
                                .then(
                                  (value) => Navigator.of(context).pop(),
                                );
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content:
                                    Text("Check your email to reset password"),
                                duration: Duration(seconds:3), 
                                backgroundColor: Color(0xFF6AC1F2),// Set the duration (adjust as needed)
                              ),
                            );
                          } on FirebaseAuthException catch (e) {
                            showDialog(
                                context: context,
                                builder: (context) {
                                  return AlertDialog(
                                    content: Text(e.message.toString()),
                                  );
                                });
                          }
                        } else
                          (print("not valid"));
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xFF2F80ED),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            S.of(context).Continue,
                            style: GoogleFonts.workSans(
                                fontSize: 15,
                                fontWeight: FontWeight.w500,
                                color: Colors.white),
                          ),
                          Icon(
                            Icons.arrow_right_alt,
                            color: Colors.white,
                          )
                        ],
                      )),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
