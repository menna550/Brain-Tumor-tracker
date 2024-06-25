import 'dart:io';

import 'package:brain_tumor/Drawer/drawer.dart';
import 'package:brain_tumor/generated/l10n.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';

class home extends StatefulWidget {

  const home({super.key});

  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {
  //_________Notification
  Future<void> getToken() async {
  try {
    final token = await FirebaseMessaging.instance.getToken();
    print('FCM Token: $token');
  } catch (e) {
    print('Error getting FCM token: $e');
  }
}

@override
  void initState() {
    getToken();
    super.initState();
  }



  //_____Multiply imagePicker syntax
  final ImagePicker _picker = ImagePicker();
  List<XFile>? _selectImages = [];

  Future<void> selectImages() async {
    final List<XFile>? pickedImages = await _picker.pickMultiImage();
    if (pickedImages != null && pickedImages.length <= 4) {
      _selectImages = pickedImages;
      showDialog(
          barrierDismissible:
              false, // This line prevents the dialog from closing when tapping outside
          context: context,
          builder: (context) {
            Future.delayed(Duration(seconds: 5), () {
              Navigator.of(context).pop();
            });

            return AlertDialog(
                title: Column(
              // mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  S.of(context).PleaseWait,
                  style: GoogleFonts.inriaSans(
                      color: Colors.grey,
                      fontSize: 18,
                      fontWeight: FontWeight.w500),
                ),
                Image.asset(
                  "assets/Animation1.gif",
                  width: 50,
                  height: 50,
                ),
                // Image.asset("assets/Animation2.gif",width: 60,height: 60,),
                TweenAnimationBuilder(
                    tween: Tween(begin: 05.0, end: 0),
                    duration: Duration(seconds: 5),
                    builder: (context, value, child) => Text(
                          "00:${value.toInt()}",
                          style: TextStyle(fontSize: 15, color: Colors.black),
                        ))
              ],
            ));
          });
    } else {
      showDialog(
          context: context,
          builder: (context) => AlertDialog(
                title: Text(
                  S.of(context).UploadFour,
                  textAlign: TextAlign.center,
                ),
                titleTextStyle: GoogleFonts.inter(
                  color: Color(0xFF004F9A),
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
              ));
    }
  }
  //_________________ get data from Firebase
  // create List to put data on it 
  // List data = [];
  // // create function to get data and make setstate on it 
  // getData()async{
  //   QuerySnapshot querySnapshot = await FirebaseFirestore.instance.collection("users").get();
  //   data.addAll(querySnapshot.docs);
  //   setState(() {
      
  //   });
  // }
  // @override
  // void initState() {
  //   getData();
  //   super.initState();
  // }



  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
              Color(0xFF004F9A),
              Color(0xFF1B2B4D),
            ])),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0.0,
            leading: InkWell(
                onTap: () {
                  advancedDrawerController.showDrawer();
                  // drawerControler();
                },
                child: Image.asset("assets/app-drawer 1.png")),
            title: RichText(
              text: TextSpan(children: [
                TextSpan(
                  text: "B R A I N\n",
                  style: GoogleFonts.inter(
                      fontSize: 20,
                      fontWeight: FontWeight.w900,
                      color: Color(0xFF7A9FD7)),
                ),
                TextSpan(
                  text: "T U M O R T R C K E R",
                  style: GoogleFonts.inter(
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                      color: Color(0xFFF1FBFF)),
                )
              ]),
            ),
          ),
          body: SingleChildScrollView(
            child: Stack(
              children: [
                //_____________________the brain in the background

                // isArabic
                //     ? Positioned(child: Image.asset("assets/brainHome2.png"),top: 150,left: 90,)
                //     : Positioned(child: Image.asset("assets/brainHome2.png"),top: 150,left: 90,),
                isArabic
                    ? Positioned(
                        top: 170,
                        right: 40,
                        child: Image.asset("assets/ArabicBrain.png"),
                      )
                    : Positioned(
                        child: Image.asset("assets/brainHome2.png"),
                        top: 150,
                        left: 90,
                      ),
                //_______________________the content of the page include text , container

                Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  child: Stack(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 30,
                          ),
                          // for (int i in data)
                          Text("${S.of(context).Hi} "
                            
          
                            ,
                            style: GoogleFonts.inriaSans(
                              color: Colors.white,
                              fontSize: 32,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Text(
                            S.of(context).paragraph,
                            style: GoogleFonts.inriaSans(
                              color: Colors.white,
                              fontSize: 24,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Text(
                            S.of(context).paragraph2,
                            style: GoogleFonts.inriaSans(
                              color: Colors.white,
                              fontSize: 24,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height *
                                (300 / 800),
                          ),
                          Container(
                            height: MediaQuery.of(context).size.height *
                                (168 / 800),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(50)),
                            child: Center(
                              child: Text(
                                S.of(context).Detection,
                                style: GoogleFonts.inriaSans(
                                  color: Color(0xFF004F9A),
                                  fontSize: 24,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 90,
                          ),
                          Container(
                            height: MediaQuery.of(context).size.height *
                                (168 / 800),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(50)),
                            child: Center(
                              child: Text(
                                S.of(context).segmentation,
                                style: GoogleFonts.inriaSans(
                                  color: Color(0xFF004F9A),
                                  fontSize: 24,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 70,
                          ),
                          RichText(
                            text: TextSpan(children: [
                              TextSpan(
                                text: S.of(context).MoreInformation,
                                style: GoogleFonts.inter(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w700,
                                    color: Colors.white),
                              ),
                              WidgetSpan(
                                  child: InkWell(
                                onTap: () {
                                  showDialog(
                                    context: context,
                                    builder: (context) => AlertDialog(
                                      scrollable: true,
                                      content: Column(
                                        children: [
                                          Padding(
                                            padding: isArabic
                                                ? const EdgeInsets.only(
                                                    left: 100, bottom: 10)
                                                : const EdgeInsets.only(
                                                    right: 165, bottom: 10),
                                            child: Text(
                                              S.of(context).DetectionWord,
                                              style: GoogleFonts.inter(
                                                  fontSize: 17,
                                                  fontWeight: FontWeight.w700,
                                                  color: Color(0xFF004F9A)),
                                            ),
                                          ),
                                          Text(
                                            S.of(context).DetectionDefinition,
                                            style: GoogleFonts.inter(
                                                fontSize: 17,
                                                fontWeight: FontWeight.w500,
                                                color: Color(0xFF004F9A)),
                                          ),
                                          Padding(
                                            padding: isArabic
                                                ? const EdgeInsets.only(
                                                    left: 80,
                                                    bottom: 10,
                                                    top: 15)
                                                : const EdgeInsets.only(
                                                    right: 130,
                                                    bottom: 10,
                                                    top: 15),
                                            child: Text(
                                              S.of(context).SegmentationWord,
                                              style: GoogleFonts.inter(
                                                  fontSize: 17,
                                                  fontWeight: FontWeight.w700,
                                                  color: Color(0xFF004F9A)),
                                            ),
                                          ),
                                          Text(
                                            S
                                                .of(context)
                                                .SegmentationDefinition,
                                            style: GoogleFonts.inter(
                                                fontSize: 17,
                                                fontWeight: FontWeight.w500,
                                                color: Color(0xFF004F9A)),
                                          ),
                                        ],
                                      ),
                                    ),
                                  );
                                },
                                child: Text(
                                  S.of(context).here,
                                  style: GoogleFonts.inter(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w800,
                                      color: Color(0xFF58BBF7)),
                                ),
                              )),
                            ]),
                          ),
                          SizedBox(
                            height: 20,
                          )
                        ],
                      ),
                      //________________________camera button1
                      Padding(
                          //to handel the posotion if it Arabic
                          padding: isArabic
                              ? const EdgeInsets.only(right: 75, top: 430)
                              : const EdgeInsets.only(left: 75, top: 430),
                          child: Image.asset("assets/blur.png")),
                      Padding(
                        //to handel the posotion if it Arabic
                        padding: isArabic
                            ? EdgeInsets.only(right: 125, top: 470)
                            : EdgeInsets.only(left: 125, top: 470),

                        child: InkWell(
                          onTap: () {
                            selectImages();
                          },
                          child: Container(
                            height: 108,
                            width: 108,
                            decoration: BoxDecoration(
                                gradient: LinearGradient(
                                    begin: Alignment.topLeft,
                                    end: Alignment.bottomRight,
                                    colors: [
                                      Color(0xFF58BBF7),
                                      Color(0xFF004F9A)
                                    ]),
                                shape: BoxShape.circle),
                            child: Image.asset("assets/photo-camera 1.png"),
                          ),
                        ),
                      ),
                      //_________________camera button2
                      Padding(
                          //to handel the posotion if it Arabic
                          padding: isArabic
                              ? const EdgeInsets.only(right: 75, top: 680)
                              : const EdgeInsets.only(left: 75, top: 680),
                          child: Image.asset("assets/blur.png")),
                      Padding(
                        //to handel the posotion if it Arabic
                        padding: isArabic
                            ? EdgeInsets.only(right: 125, top: 730)
                            : EdgeInsets.only(left: 125, top: 730),

                        child: InkWell(
                          onTap: () {
                            selectImages();
                          },
                          child: Container(
                            height: 108,
                            width: 108,
                            decoration: BoxDecoration(
                                gradient: LinearGradient(
                                    begin: Alignment.topLeft,
                                    end: Alignment.bottomRight,
                                    colors: [
                                      Color(0xFF58BBF7),
                                      Color(0xFF004F9A)
                                    ]),
                                shape: BoxShape.circle),
                            child: Image.asset("assets/photo-camera 1.png"),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void drawerControler() {
    advancedDrawerController.showDrawer();
  }
}
