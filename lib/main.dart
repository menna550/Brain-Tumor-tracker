import 'package:brain_tumor/Drawer/drawer.dart';
import 'package:brain_tumor/generated/l10n.dart';
import 'package:brain_tumor/screens/Login_SignUp.dart/login.dart';
import 'package:brain_tumor/screens/Login_SignUp.dart/sign_up.dart';
import 'package:brain_tumor/screens/OnBordingScreen/onbording_screen.dart';
import 'package:brain_tumor/screens/OnBordingScreen/page1.dart';
import 'package:brain_tumor/screens/OnBordingScreen/page2.dart';
import 'package:brain_tumor/screens/forgetPassScreen/NewPassword.dart';
import 'package:brain_tumor/screens/forgetPassScreen/forgetPass.dart';
import 'package:brain_tumor/screens/forgetPassScreen/verificationCode.dart';
import 'package:brain_tumor/Drawer/home.dart';
import 'package:brain_tumor/screens/splash_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:firebase_app_check/firebase_app_check.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: const FirebaseOptions(
          apiKey: 'AIzaSyCw3T2NVBhTvhaYNQXT46nLh7qvMNfRpro', 
          appId: '1:921757295091:android:fc2572c3627a48c58c7286', 
          messagingSenderId: 'brain-tumer-tracker', 
          projectId: 'brain-tumer-tracker'));
          
      // FirebaseAppCheck firebaseAppCheck = FirebaseAppCheck.getInstance(); firebaseAppCheck.installAppCheckProviderFactory( SafetyNetAppCheckProviderFactory.getInstance());
  runApp(const MyApp());

  AwesomeNotifications().initialize(
    null,
    [
      NotificationChannel(channelKey: "basic_channel", 
      channelName: "Basic notification", 
      channelDescription: "notification channel for basic tests",
      importance: NotificationImportance.Max
      )
    ],
    debug: true,
  );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
  static _MyAppState? of(BuildContext context) =>
      context.findAncestorStateOfType<_MyAppState>();
}

class _MyAppState extends State<MyApp> {
  //________________this for Firebase
  @override
  void initState() {
    FirebaseAuth.instance.authStateChanges().listen((User? user) {
      if (user == null) {
        print('User is currently signed out!');
      } else {
        print('User is signed in!');
      }
    });
    super.initState();
  }

// this is for Localization
  Locale _locale = Locale('en', '');

  setLocale(Locale locale) {
    setState(() {
      _locale = locale;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // this is for Localization
      locale: _locale,
      localizationsDelegates: [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: [
        const Locale('en'), // English
        const Locale('ar'), // arabic
      ],

      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
      ),
      home: splash_screen(),
      routes: {"login": (context) => login_screen(),
      },
    );
  }
}
