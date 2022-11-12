import 'package:fbank/styles/colors.dart';
import 'package:fbank/ui/intro_screen/intro_screen.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import 'ui/sign_up_screen/sign_up_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) {
        return MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData.light().copyWith(
            textTheme: TextTheme(
              headline4: TextStyle(
                  fontSize: 30.sp,
                  fontWeight: FontWeight.w600,
                  color: kTextDarkColor,
                  fontFamily: 'SourceSansPro'),
              headline6: TextStyle(
                  fontSize: 17.sp,
                  fontWeight: FontWeight.w600,
                  color: kTextDarkColor,
                  fontFamily: 'SourceSansPro'),
              subtitle1: TextStyle(
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w400,
                  color: kTextDarkColor,
                  fontFamily: 'SourceSansPro'),
              subtitle2: TextStyle(
                  fontSize: 11.sp,
                  fontWeight: FontWeight.w300,
                  color: kTextDarkColor,
                  fontFamily: 'SourceSansPro'),
              caption: TextStyle(
                  fontSize: 8.sp,
                  fontWeight: FontWeight.w400,
                  color: kTextDarkColor,
                  fontFamily: 'SourceSansPro'),
            ),
            iconTheme: IconThemeData(
              color: kSecondaryDarkColor,
              size: 23.sp,
            ),
          ),
          initialRoute: IntroScreen.routeName,
          routes: <String, WidgetBuilder>{
            IntroScreen.routeName: (context) => IntroScreen(),
            SignUpScreen.routeName: (context) => SignUpScreen(),
          },
        );
      },
    );
  }
}
