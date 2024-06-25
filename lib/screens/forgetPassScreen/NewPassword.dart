import 'package:brain_tumor/generated/l10n.dart';
import 'package:brain_tumor/screens/Login_SignUp.dart/login.dart';
import 'package:brain_tumor/screens/forgetPassScreen/verificationCode.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';

class NewPassword extends StatefulWidget {
  const NewPassword({super.key});

  @override
  State<NewPassword> createState() => _NewPasswordState();
}

bool PasswordSecured = true;
//global key for validation
GlobalKey<FormState> formstate = GlobalKey();

class _NewPasswordState extends State<NewPassword> {
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
                              builder: (BuildContext context) =>
                                  verificationCode(),
                            ),
                          );
                        },
                        icon: Icon(Icons.arrow_back))),
                Image.asset("assets/illustration (2).png"),
                SizedBox(
                  height: 30,
                ),
                Text(
                  S.of(context).EnterNewPassword,
                  style: GoogleFonts.workSans(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  S.of(context).NewPassDetails,
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
                    obscureText: PasswordSecured,
                    cursorColor: Color(0xFF2F80ED),
                    //this mode to make the error apeare untill the user wirte it correct
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    decoration: InputDecoration(
                        suffixIcon: IconButton(
                          padding: EdgeInsets.only(right: 12),
                          onPressed: () {
                            setState(() {
                              PasswordSecured = !PasswordSecured;
                            });
                          },
                          icon: Icon(PasswordSecured
                              ? Icons.visibility_off
                              : Icons.visibility),
                        ),
                        labelText: S.of(context).NewPassword,
                        labelStyle: GoogleFonts.workSans(
                            color: Color(0xFF333333).withOpacity(60 / 100),
                            fontSize: 17,
                            fontWeight: FontWeight.w400),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide: BorderSide(
                                color:
                                    Color(0xFF333333).withOpacity(60 / 100))),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide: BorderSide(
                                color:
                                    Color(0xFF333333).withOpacity(60 / 100)))),

                    //validation
                    validator: (value) {
                      if (value!.isEmpty) {
                        return S.of(context).EmptyPassword;
                      }
                      if(value.length < 8){
                                    return S.of(context).weak;
                                  }
                    },
                  ),
                ),
                SizedBox(
                  height: 40,
                ),
                ElevatedButton(
                    onPressed: () {
                      if (formstate.currentState!.validate()) {
                        showDialog(
                          barrierDismissible: false,
                          context: context,
                          builder: (context) => AlertDialog(
                            backgroundColor: Colors.white,
                            icon: Image.asset('assets/success.png'),
                            title: Text(
                              S.of(context).Congratulations,
                              textAlign: TextAlign.center,
                              style: GoogleFonts.inter(
                                  color: Colors.black,
                                  fontSize: 24,
                                  fontWeight: FontWeight.w500,
                                  shadows: [
                                    Shadow(
                                      offset: Offset(0, 4),
                                      blurRadius: 4.0,
                                      color: Colors.black.withOpacity(0.2),
                                    )
                                  ]),
                            ),
                            content: Text(
                              textAlign: TextAlign.center,
                              S.of(context).ResetPassword,
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
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
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
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFF2F80ED),
                    ),
                    child: Text(
                      S.of(context).Send,
                      style: GoogleFonts.workSans(
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                          color: Colors.white),
                    ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
