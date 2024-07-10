// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Welcome! `
  String get Hi {
    return Intl.message(
      'Welcome! ',
      name: 'Hi',
      desc: '',
      args: [],
    );
  }

  /// `We hope you speed recovery\nLet’s check on your health`
  String get paragraph {
    return Intl.message(
      'We hope you speed recovery\nLet’s check on your health',
      name: 'paragraph',
      desc: '',
      args: [],
    );
  }

  /// `Make sure to enter photos of\nMRI or CT scan`
  String get paragraph2 {
    return Intl.message(
      'Make sure to enter photos of\nMRI or CT scan',
      name: 'paragraph2',
      desc: '',
      args: [],
    );
  }

  /// `If you want to make\nDetection process `
  String get Detection {
    return Intl.message(
      'If you want to make\nDetection process ',
      name: 'Detection',
      desc: '',
      args: [],
    );
  }

  /// `If you want to make\nSegmentation process`
  String get segmentation {
    return Intl.message(
      'If you want to make\nSegmentation process',
      name: 'segmentation',
      desc: '',
      args: [],
    );
  }

  /// `Home`
  String get home {
    return Intl.message(
      'Home',
      name: 'home',
      desc: '',
      args: [],
    );
  }

  /// `mennag1020@gmail.com`
  String get username {
    return Intl.message(
      'mennag1020@gmail.com',
      name: 'username',
      desc: '',
      args: [],
    );
  }

  /// `Language`
  String get language {
    return Intl.message(
      'Language',
      name: 'language',
      desc: '',
      args: [],
    );
  }

  /// `About Us`
  String get aboutUs {
    return Intl.message(
      'About Us',
      name: 'aboutUs',
      desc: '',
      args: [],
    );
  }

  /// `Log Out`
  String get logOut {
    return Intl.message(
      'Log Out',
      name: 'logOut',
      desc: '',
      args: [],
    );
  }

  /// `Log out of your account ?`
  String get LogOut_Ques {
    return Intl.message(
      'Log out of your account ?',
      name: 'LogOut_Ques',
      desc: '',
      args: [],
    );
  }

  /// `Cancel`
  String get cancel {
    return Intl.message(
      'Cancel',
      name: 'cancel',
      desc: '',
      args: [],
    );
  }

  /// `App language`
  String get appLanguage {
    return Intl.message(
      'App language',
      name: 'appLanguage',
      desc: '',
      args: [],
    );
  }

  /// `Full Name`
  String get FullName {
    return Intl.message(
      'Full Name',
      name: 'FullName',
      desc: '',
      args: [],
    );
  }

  /// `Email Address`
  String get emailAddress {
    return Intl.message(
      'Email Address',
      name: 'emailAddress',
      desc: '',
      args: [],
    );
  }

  /// `Password`
  String get password {
    return Intl.message(
      'Password',
      name: 'password',
      desc: '',
      args: [],
    );
  }

  /// `Confirm Password`
  String get ConfirmPassword {
    return Intl.message(
      'Confirm Password',
      name: 'ConfirmPassword',
      desc: '',
      args: [],
    );
  }

  /// `Login`
  String get login {
    return Intl.message(
      'Login',
      name: 'login',
      desc: '',
      args: [],
    );
  }

  /// `Forget Password?`
  String get forgetPassword {
    return Intl.message(
      'Forget Password?',
      name: 'forgetPassword',
      desc: '',
      args: [],
    );
  }

  /// `Sign Up`
  String get signUp {
    return Intl.message(
      'Sign Up',
      name: 'signUp',
      desc: '',
      args: [],
    );
  }

  /// `Don’t have any account?`
  String get AnyAccount {
    return Intl.message(
      'Don’t have any account?',
      name: 'AnyAccount',
      desc: '',
      args: [],
    );
  }

  /// `Already have an account?`
  String get haveAccount {
    return Intl.message(
      'Already have an account?',
      name: 'haveAccount',
      desc: '',
      args: [],
    );
  }

  /// `Please Enter your email`
  String get EmailEmpty {
    return Intl.message(
      'Please Enter your email',
      name: 'EmailEmpty',
      desc: '',
      args: [],
    );
  }

  /// `Please enter a valid email`
  String get ValidEmail {
    return Intl.message(
      'Please enter a valid email',
      name: 'ValidEmail',
      desc: '',
      args: [],
    );
  }

  /// `Please Enter your password`
  String get EmptyPassword {
    return Intl.message(
      'Please Enter your password',
      name: 'EmptyPassword',
      desc: '',
      args: [],
    );
  }

  /// `Password weak`
  String get weak {
    return Intl.message(
      'Password weak',
      name: 'weak',
      desc: '',
      args: [],
    );
  }

  /// `Please Enter your name`
  String get EmptyName {
    return Intl.message(
      'Please Enter your name',
      name: 'EmptyName',
      desc: '',
      args: [],
    );
  }

  /// `Password don’t match`
  String get matchPassword {
    return Intl.message(
      'Password don’t match',
      name: 'matchPassword',
      desc: '',
      args: [],
    );
  }

  /// `Don’t worry, it happens to the best of\nus.`
  String get DoNotWorry {
    return Intl.message(
      'Don’t worry, it happens to the best of\nus.',
      name: 'DoNotWorry',
      desc: '',
      args: [],
    );
  }

  /// `Send`
  String get Continue {
    return Intl.message(
      'Send',
      name: 'Continue',
      desc: '',
      args: [],
    );
  }

  /// `You should add only 4 images`
  String get UploadFour {
    return Intl.message(
      'You should add only 4 images',
      name: 'UploadFour',
      desc: '',
      args: [],
    );
  }

  /// `Please wait`
  String get PleaseWait {
    return Intl.message(
      'Please wait',
      name: 'PleaseWait',
      desc: '',
      args: [],
    );
  }

  /// `"Your Brain Health is Our Top Priority, Learn About Our application and Services"`
  String get OurPriority {
    return Intl.message(
      '"Your Brain Health is Our Top Priority, Learn About Our application and Services"',
      name: 'OurPriority',
      desc: '',
      args: [],
    );
  }

  /// `What we do ?`
  String get WhatWeDo {
    return Intl.message(
      'What we do ?',
      name: 'WhatWeDo',
      desc: '',
      args: [],
    );
  }

  /// `• Our mission is to improve brain health by providing advanced technology and expertise for the accurate detection, classification, and segmentation of brain tumor, We aim to detect and predict brain tumors at an early stage to prevent malignancy and achieve better patient outcomes. Our system assists medical professionals in early detection and diagnosis, highlighting the importance of new technologies in medical imaging analysis. By providing quick and accurate results, and we aim to save time, effort, and resources for both patients and doctors. `
  String get OurMission {
    return Intl.message(
      '• Our mission is to improve brain health by providing advanced technology and expertise for the accurate detection, classification, and segmentation of brain tumor, We aim to detect and predict brain tumors at an early stage to prevent malignancy and achieve better patient outcomes. Our system assists medical professionals in early detection and diagnosis, highlighting the importance of new technologies in medical imaging analysis. By providing quick and accurate results, and we aim to save time, effort, and resources for both patients and doctors. ',
      name: 'OurMission',
      desc: '',
      args: [],
    );
  }

  /// `Who we are ?`
  String get WhoWeAre {
    return Intl.message(
      'Who we are ?',
      name: 'WhoWeAre',
      desc: '',
      args: [],
    );
  }

  /// `• We are students at the Faculty of Computers and Information, Suez Canal University who trying to create a simple and easy-to-use site that is highly efficient and saves time to reassure the patient about his condition by sending the results of the MRI analysis`
  String get WeAreStudents {
    return Intl.message(
      '• We are students at the Faculty of Computers and Information, Suez Canal University who trying to create a simple and easy-to-use site that is highly efficient and saves time to reassure the patient about his condition by sending the results of the MRI analysis',
      name: 'WeAreStudents',
      desc: '',
      args: [],
    );
  }

  /// `If you want to learn more about Detection and Segmentation please press  `
  String get MoreInformation {
    return Intl.message(
      'If you want to learn more about Detection and Segmentation please press  ',
      name: 'MoreInformation',
      desc: '',
      args: [],
    );
  }

  /// `here`
  String get here {
    return Intl.message(
      'here',
      name: 'here',
      desc: '',
      args: [],
    );
  }

  /// `• Detection`
  String get DetectionWord {
    return Intl.message(
      '• Detection',
      name: 'DetectionWord',
      desc: '',
      args: [],
    );
  }

  /// `Detection of a brain tumor is an important step to better understanding its mechanism, Magenatic Reasoning Imagning (MRI) is a medical imagining techniqe that helps the radiologist find the tumor region.`
  String get DetectionDefinition {
    return Intl.message(
      'Detection of a brain tumor is an important step to better understanding its mechanism, Magenatic Reasoning Imagning (MRI) is a medical imagining techniqe that helps the radiologist find the tumor region.',
      name: 'DetectionDefinition',
      desc: '',
      args: [],
    );
  }

  /// `• Segmentation`
  String get SegmentationWord {
    return Intl.message(
      '• Segmentation',
      name: 'SegmentationWord',
      desc: '',
      args: [],
    );
  }

  /// `Process of identifiying the cancerous brain tissues and labeling them automatically based on the tumor types, Manual segmentation of tumor from brain MRI is time-consuming and error-prone.`
  String get SegmentationDefinition {
    return Intl.message(
      'Process of identifiying the cancerous brain tissues and labeling them automatically based on the tumor types, Manual segmentation of tumor from brain MRI is time-consuming and error-prone.',
      name: 'SegmentationDefinition',
      desc: '',
      args: [],
    );
  }

  /// `Password Reset successful\nYou can now log in to your account `
  String get ResetPassword {
    return Intl.message(
      'Password Reset successful\nYou can now log in to your account ',
      name: 'ResetPassword',
      desc: '',
      args: [],
    );
  }

  /// `Congratulations !`
  String get Congratulations {
    return Intl.message(
      'Congratulations !',
      name: 'Congratulations',
      desc: '',
      args: [],
    );
  }

  /// `New Password`
  String get NewPassword {
    return Intl.message(
      'New Password',
      name: 'NewPassword',
      desc: '',
      args: [],
    );
  }

  /// `Enter New Password`
  String get EnterNewPassword {
    return Intl.message(
      'Enter New Password',
      name: 'EnterNewPassword',
      desc: '',
      args: [],
    );
  }

  /// `Your new password must be different\nfrom previously used password`
  String get NewPassDetails {
    return Intl.message(
      'Your new password must be different\nfrom previously used password',
      name: 'NewPassDetails',
      desc: '',
      args: [],
    );
  }

  /// `Login Now `
  String get LoginNow {
    return Intl.message(
      'Login Now ',
      name: 'LoginNow',
      desc: '',
      args: [],
    );
  }

  /// `Send`
  String get Send {
    return Intl.message(
      'Send',
      name: 'Send',
      desc: '',
      args: [],
    );
  }

  /// `The account already exists for that email.`
  String get AccExist {
    return Intl.message(
      'The account already exists for that email.',
      name: 'AccExist',
      desc: '',
      args: [],
    );
  }

  /// `Error`
  String get Error {
    return Intl.message(
      'Error',
      name: 'Error',
      desc: '',
      args: [],
    );
  }

  /// `Your account has been created!\ncheck your email to\nverify your account`
  String get AccountHasBeenCreated {
    return Intl.message(
      'Your account has been created!\ncheck your email to\nverify your account',
      name: 'AccountHasBeenCreated',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'ar'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
