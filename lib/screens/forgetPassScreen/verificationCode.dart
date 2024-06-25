import 'package:brain_tumor/screens/forgetPassScreen/NewPassword.dart';
import 'package:brain_tumor/screens/forgetPassScreen/forgetPass.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';

class verificationCode extends StatefulWidget {
  const verificationCode({super.key});

  @override
  State<verificationCode> createState() => _verificationCodeState();
}

class _verificationCodeState extends State<verificationCode> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Form(
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
                                  forgetPassScreen(),
                            ),
                          );
                        },
                        icon: Icon(Icons.arrow_back))),
                Image.asset("assets/illustration3.png"),
                SizedBox(
                  height: 30,
                ),
                Text(
                  "Check your mail",
                  style: GoogleFonts.workSans(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "Please enter the 4 digit code that\nsend to your email address",
                  textAlign: TextAlign.center,
                  style: GoogleFonts.workSans(
                    fontSize: 15,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                SizedBox(
                  height: 25,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SizedBox(
                      height: 68,
                      width: 64,
                      child: TextFormField(
                        onChanged: (value) {
                          if(value.length == 1){
                            FocusScope.of(context).nextFocus();
                          }
                        },
                        textAlign: TextAlign.center,
                          cursorColor: Color(0xFF2F80ED),
                          decoration: InputDecoration(
                              filled: true,
                              fillColor: Color.fromARGB(15, 47, 129, 237),
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20),
                                  borderSide: BorderSide(
                                      color:
                                          Color.fromARGB(80, 47, 129, 237))),
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20),
                                  borderSide: BorderSide(
                                      color:
                                          Color.fromARGB(80, 47, 129, 237)))),
                          keyboardType: TextInputType.number,
                          inputFormatters: [
                            LengthLimitingTextInputFormatter(1),
                            FilteringTextInputFormatter.digitsOnly
                          ]),
                    ),
                    SizedBox(
                      height: 68,
                      width: 64,
                      child: TextFormField(
                        onChanged: (value) {
                          if(value.length == 1){
                            FocusScope.of(context).nextFocus();
                          }
                        },
                        textAlign: TextAlign.center,
                          cursorColor: Color(0xFF2F80ED),
                          decoration: InputDecoration(
                              filled: true,
                              fillColor: Color.fromARGB(15, 47, 129, 237),
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20),
                                  borderSide: BorderSide(
                                      color:
                                          Color.fromARGB(80, 47, 129, 237))),
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20),
                                  borderSide: BorderSide(
                                      color:
                                          Color.fromARGB(80, 47, 129, 237)))),
                          keyboardType: TextInputType.number,
                          inputFormatters: [
                            LengthLimitingTextInputFormatter(1),
                            FilteringTextInputFormatter.digitsOnly
                          ]),
                    ),
                    SizedBox(
                      height: 68,
                      width: 64,
                      child: TextFormField(
                        onChanged: (value) {
                          if(value.length == 1){
                            FocusScope.of(context).nextFocus();
                          }
                        },
                        textAlign: TextAlign.center,
                          cursorColor: Color(0xFF2F80ED),
                          decoration: InputDecoration(
                              filled: true,
                              fillColor: Color.fromARGB(15, 47, 129, 237),
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20),
                                  borderSide: BorderSide(
                                      color:
                                          Color.fromARGB(80, 47, 129, 237))),
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20),
                                  borderSide: BorderSide(
                                      color:
                                          Color.fromARGB(80, 47, 129, 237)))),
                          keyboardType: TextInputType.number,
                          inputFormatters: [
                            LengthLimitingTextInputFormatter(1),
                            FilteringTextInputFormatter.digitsOnly
                          ]),
                    ),
                    SizedBox(
                      height: 68,
                      width: 64,
                      child: TextFormField(
                        onChanged: (value) {
                          if(value.length == 1){
                            FocusScope.of(context).nextFocus();
                          }
                        },
                        textAlign: TextAlign.center,
                          cursorColor: Color(0xFF2F80ED),
                          decoration: InputDecoration(
                              filled: true,
                              fillColor: Color.fromARGB(15, 47, 129, 237),
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20),
                                  borderSide: BorderSide(
                                      color:
                                          Color.fromARGB(80, 47, 129, 237))),
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20),
                                  borderSide: BorderSide(
                                      color:
                                          Color.fromARGB(80, 47, 129, 237)))),
                          keyboardType: TextInputType.number,
                          inputFormatters: [
                            LengthLimitingTextInputFormatter(1),
                            FilteringTextInputFormatter.digitsOnly
                          ]),
                    )
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.center,
                //   children: [
                //     TextButton(
                //       onPressed: (){}, 
                //       child: Text(
                //   "Resend code ",
                //   textAlign: TextAlign.center,
                //   style: GoogleFonts.workSans(
                //     fontSize: 15,
                //     fontWeight: FontWeight.w400,
                //     color: Color(0xFF2F80ED),
                //   ),
                // ),),
                // Text(
                //   "after ",
                //   textAlign: TextAlign.center,
                //   style: GoogleFonts.workSans(
                //     fontSize: 15,
                //     fontWeight: FontWeight.w400,
                //   ),
                // ),
                // TweenAnimationBuilder(tween: Tween(begin: 30.0,end: 0), duration: Duration(seconds: 30), builder: (context,value,child)=>Text("00:${value.toInt()}"))
                // ],),
                SizedBox(
                  height: 30,
                ),
                //verify Button
                Padding(
                  padding: const EdgeInsets.only(left: 120, right: 120),
                  child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute<void>(
                            builder: (BuildContext context) => NewPassword(),
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xFF2F80ED),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Verify",
                            style: GoogleFonts.workSans(
                                fontSize: 15,
                                fontWeight: FontWeight.w500,
                                color: Colors.white),
                          ),
                          Icon(
                            Icons.check,
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
