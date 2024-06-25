import 'package:brain_tumor/Drawer/AboutUs_screen.dart';
import 'package:brain_tumor/generated/l10n.dart';
import 'package:brain_tumor/Drawer/home.dart';
import 'package:brain_tumor/main.dart';
import 'package:brain_tumor/screens/Login_SignUp.dart/login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';
import 'package:google_fonts/google_fonts.dart';

enum Language { english, arabic }

class drawer extends StatefulWidget {
  const drawer({super.key});

  @override
  State<drawer> createState() => _drawerState();
}

// String language = "English";

final advancedDrawerController = AdvancedDrawerController();
bool isArabic = false;


class _drawerState extends State<drawer> {
  final ValueNotifier<String> _currentScreen = ValueNotifier<String>('home');
void _setScreen(String screen) {
  _currentScreen.value = screen;
  advancedDrawerController.hideDrawer();
  
}
@override
  void dispose() {
    _currentScreen.dispose();
    super.dispose();
  }

  Language? _selectedLanguage = Language.english;
  @override
  Widget build(BuildContext context) {
    return Container(
      // color:Color.fromARGB(129, 0, 80, 154) ,
      color: Color.fromARGB(255, 157, 199, 238),

      child: AdvancedDrawer(
          rtlOpening: isArabic ? true : false,
          controller: advancedDrawerController,
          animationCurve: Curves.easeInOut,
          animationDuration: Duration(milliseconds: 600),
          openRatio: 0.55,
          backdropColor: Colors.transparent,
          childDecoration: const BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(20)),
          ),
          child: ValueListenableBuilder<String>(
            valueListenable: _currentScreen,
            builder: (context, screen, _) {
              switch (screen) {
                case 'home':
                  return home();
                case 'about':
                  return aboutUs();
                default:
                  return home();
              }
            },
          ),
          drawer: SafeArea(
              child: Column(
            children: [
              SizedBox(
                height: 40,
              ),
              Image.asset(
                "assets/user3.png",
                width: 70.0,
                height: 70.0,
              ),
              SizedBox(
                height: 10.0,
              ),
              Text(
                S.of(context).username,
                // "defult@gmail.com",
                style: GoogleFonts.inter(
                    fontSize: 13,
                    fontWeight: FontWeight.w700,
                    color: Color(0xFF004F9A)),
              ),
              SizedBox(
                height: 20,
              ),
              Divider(
                color: Colors.white,
                thickness: 1,
                indent: 50,
                endIndent: 50,
              ),
              SizedBox(
                height: 10,
              ),
              Expanded(
                  child: ListView(
                children: [
                  ListTile(
                    onTap: () => _setScreen('home'),
                    leading: Icon(
                      Icons.home,
                      color: Color(0xFF004F9A),
                    ),
                    title: Text(
                      S.of(context).home,
                      style: GoogleFonts.inter(
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                          color: Color(0xFF004F9A)),
                    ),
                  ),
                  //_______________Language
                  ListTile(
                    onTap: () {
                      showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                                title: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    InkWell(
                                      onTap: () {
                                        Navigator.pop(context);
                                      },
                                      child: Icon(
                                        Icons.close_rounded,
                                        color: Color(0xFF004F9A),
                                      ),
                                    ),
                                    Text(
                                      S.of(context).appLanguage,
                                      style: GoogleFonts.inter(
                                          fontSize: 20,
                                          fontWeight: FontWeight.w700,
                                          color: Color(0xFF004F9A)),
                                    )
                                  ],
                                ),
                                actions: [
                                  Column(
                                    children: [
                                      Divider(),
                                      RadioListTile<Language>(
                                          title: Text("English"),
                                          value: Language.english,
                                          groupValue: _selectedLanguage,
                                          activeColor: Color(0xFF004F9A),
                                          onChanged: (Language? value) {
                                            setState(() {
                                              _selectedLanguage = value;
                                              MyApp.of(context)?.setLocale(
                                                  Locale(
                                                      value == Language.english
                                                          ? 'en'
                                                          : 'ar',
                                                      ''));
                                              isArabic = false;
                                            });
                                          }),
                                      RadioListTile(
                                          title: Text("العربية"),
                                          value: Language.arabic,
                                          groupValue: _selectedLanguage,
                                          activeColor: Color(0xFF004F9A),
                                          onChanged: (Language? value) {
                                            setState(() {
                                              _selectedLanguage = value;
                                              MyApp.of(context)?.setLocale(
                                                  Locale(
                                                      value == Language.english
                                                          ? 'en'
                                                          : 'ar',
                                                      ''));
                                              isArabic = true;
                                            });
                                          })
                                    ],
                                  )
                                ],
                              ));
                    },
                    leading: Icon(
                      Icons.language,
                      color: Color(0xFF004F9A),
                    ),
                    title: Text(
                      S.of(context).language,
                      style: GoogleFonts.inter(
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                          color: Color(0xFF004F9A)),
                    ),
                  ),
                  //__________________________About Us
                  ListTile(
                    onTap: () => _setScreen('about'),
                    leading: Icon(
                      Icons.people,
                      color: Color(0xFF004F9A),
                    ),
                    title: Text(
                      S.of(context).aboutUs,
                      style: GoogleFonts.inter(
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                          color: Color(0xFF004F9A)),
                    ),
                  ),
                  //_________________________Log Out
                  ListTile(
                    onTap: () {
                      showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                                title: Text(S.of(context).LogOut_Ques),
                                titleTextStyle: GoogleFonts.inter(
                                  color: Color(0xFF004F9A),
                                  fontSize: 20,
                                  fontWeight: FontWeight.w500,
                                ),
                                actions: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      TextButton(
                                          onPressed: () {
                                            Navigator.pop(context);
                                          },
                                          child: Text(S.of(context).cancel,
                                              style: GoogleFonts.inter(
                                                color: Color(0xFF004F9A),
                                                fontSize: 16,
                                                fontWeight: FontWeight.w500,
                                              ))),
                                      TextButton(
                                          onPressed: () async {
                                            await FirebaseAuth.instance
                                                .signOut();
                                                Navigator.of(context).pushNamedAndRemoveUntil("login", (route) => false);
                                          },
                                          child: Text(S.of(context).logOut,
                                              style: GoogleFonts.inter(
                                                color: Colors.red,
                                                fontSize: 16,
                                                fontWeight: FontWeight.w500,
                                              ))),
                                    ],
                                  )
                                ],
                              ));
                    },
                    leading: Icon(
                      Icons.logout,
                      color: Color(0xFF004F9A),
                    ),
                    title: Text(
                      S.of(context).logOut,
                      style: GoogleFonts.inter(
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                          color: Color(0xFF004F9A)),
                    ),
                  ),
                ],
              ))
            ],
          ))),
    );
  }

  void drawerControler() {
    advancedDrawerController.showDrawer();
  }
  // void _setLocale(String languageCode) async {
  //   Locale _locale = await setLocale(languageCode);
  //   MyApp.setLocale(context, _locale);
  // }
}
