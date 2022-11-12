import 'package:fbank/animations/custom_route.dart';
import 'package:fbank/styles/colors.dart';
import 'package:fbank/styles/const.dart';
import 'package:fbank/ui/sign_up_screen/sign_up_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sizer/sizer.dart';

class IntroScreen extends StatefulWidget {
  static const String routeName = 'IntroScreen';
  const IntroScreen({Key? key}) : super(key: key);

  @override
  State<IntroScreen> createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen>
    with TickerProviderStateMixin {
  AnimationController? _controller;
  final Tween<double> _tween = Tween(begin: 0.75, end: 2);

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
        duration: const Duration(milliseconds: 700), vsync: this);
    _controller!.repeat(reverse: true);
  }

  List<Color> colorList = const [
    kPrimaryColor,
    kSecondaryColor,
    kPrimaryDarkColor,
    kSecondaryDarkColor
  ];

  List<Alignment> alignmentList = [
    Alignment.bottomLeft,
    Alignment.bottomRight,
    Alignment.topRight,
    Alignment.topLeft,
  ];

  int index = 0;
  Color bottomColor = kSecondaryDarkColor;
  Color topColor = kSecondaryColor;
  Alignment begin = Alignment.centerLeft;
  Alignment end = Alignment.topRight;

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(microseconds: 10), () {
      setState(() {
        bottomColor = Colors.blue;
      });
    });
    return Scaffold(
      body: AnimatedContainer(
        duration: const Duration(seconds: 2),
        onEnd: () {
          setState(() {
            index = index + 1;
            bottomColor = colorList[index % colorList.length];
            topColor = colorList[(index + 1) % colorList.length];
          });
        },
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: begin,
            end: end,
            colors: [
              bottomColor,
              topColor,
              kSecondaryDarkColor,
              kPrimaryDarkColor
            ],
          ),
        ),
        child: Padding(
          padding: EdgeInsets.only(left: 5.w, right: 5.w),
          child: Column(
            children: [
              const Spacer(),
              InkWell(
                onTap: () {
                  //go to login Screen
                },
                child: Column(
                  children: [
                    ScaleTransition(
                      scale: _tween.animate(
                        CurvedAnimation(
                            parent: _controller!, curve: Curves.linear),
                      ),
                      child: CircleAvatar(
                        backgroundColor: kPrimaryColor,
                        radius: 2.h,
                        child: Icon(
                          Icons.arrow_upward,
                          color: kTextDarkColor,
                          size: 20.sp,
                        ),
                      ),
                    ),
                    k4SizedBox,
                    Text(
                      'Tap here to Log In',
                      style: Theme.of(context).textTheme.subtitle1,
                    ),
                  ],
                ),
              ),
              const Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  BottomButton(
                      onTap: () {
                        //show bottom sheet
                        showModalBottomSheet<void>(
                          context: context,
                          backgroundColor: Colors.transparent,
                          builder: (BuildContext context) {
                            return Container(
                              height: 30.h,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(3.h),
                                gradient: LinearGradient(
                                  begin: begin,
                                  end: end,
                                  colors: [
                                    bottomColor,
                                    topColor,
                                    kSecondaryDarkColor,
                                    kPrimaryDarkColor,
                                  ],
                                ),
                              ),
                              child: Column(
                                children: [
                                  SizedBox(
                                    width: 12.w,
                                    child: const Divider(
                                      thickness: 3.0,
                                      color: kTextDarkColor,
                                    ),
                                  ),
                                  const Spacer(),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      SheetButton(
                                          onPress: () {},
                                          iconData: 'assets/icons/ic1.svg',
                                          title: 'Open an\nAccount'),
                                      SheetButton(
                                          onPress: () {},
                                          iconData: 'assets/icons/ic2.svg',
                                          title: 'Biometric\nVerification'),
                                      SheetButton(
                                          onPress: () {},
                                          iconData: 'assets/icons/ic3.svg',
                                          title: 'QR\nPay'),
                                      SheetButton(
                                          onPress: () {},
                                          iconData: 'assets/icons/ic4.svg',
                                          title: 'My\nQR'),
                                    ],
                                  ),
                                  k2SizedBox,
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      SheetButton(
                                          onPress: () {},
                                          iconData: 'assets/icons/ic5.svg',
                                          title: 'Car\nLoan'),
                                      SheetButton(
                                          onPress: () {},
                                          iconData: 'assets/icons/ic6.svg',
                                          title: 'Near\nYou'),
                                      SheetButton(
                                          onPress: () {},
                                          iconData: 'assets/icons/ic7.svg',
                                          title: 'Locate\nUs'),
                                      SheetButton(
                                          onPress: () {},
                                          iconData: 'assets/icons/ic8.svg',
                                          title: 'Help'),
                                    ],
                                  ),
                                  k2SizedBox,
                                  const Spacer(),
                                ],
                              ),
                            );
                          },
                        );
                      },
                      title: 'More',
                      dColor: kTextDarkColor),
                  BottomButton(
                      onTap: () {
                        //sign up screen route
                        //create a route with custom route animation
                        Navigator.of(context)
                            .push(customRouteAnimation(const SignUpScreen()));
                      },
                      title: 'Sign Up',
                      dColor: Colors.transparent),
                ],
              ),
              k4SizedBox,
            ],
          ),
        ),
      ),
    );
  }
}

class SheetButton extends StatelessWidget {
  const SheetButton(
      {Key? key,
      required this.onPress,
      required this.iconData,
      required this.title})
      : super(key: key);
  final VoidCallback onPress;
  final String iconData;
  final String title;
  @override
  Widget build(BuildContext context) {
    return InkResponse(
      onTap: onPress,
      highlightShape: BoxShape.circle,
      child: Container(
        width: 20.w,
        height: 10.h,
        margin: EdgeInsets.only(left: 2.w, right: 2.w),
        decoration: BoxDecoration(
          color: kTextColor,
          borderRadius: BorderRadius.circular(2.h),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              iconData,
              height: 18.sp,
            ),
            SizedBox(
              height: 1.h,
            ),
            Text(
              title,
              style: Theme.of(context).textTheme.caption,
            )
          ],
        ),
      ),
    );
  }
}

class BottomButton extends StatelessWidget {
  const BottomButton(
      {Key? key,
      required this.onTap,
      required this.title,
      required this.dColor})
      : super(key: key);
  final VoidCallback onTap;
  final String title;
  final Color dColor;
  @override
  Widget build(BuildContext context) {
    return InkResponse(
      onTap: onTap,
      child: Column(
        children: [
          Text(
            title,
            style: Theme.of(context).textTheme.subtitle1!.copyWith(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w500,
                ),
          ),
          SizedBox(
            width: 12.w,
            child: Divider(
              color: dColor,
              thickness: 2.0,
              height: 20.0,
            ),
          ),
        ],
      ),
    );
  }
}
