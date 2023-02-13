import 'package:flutter/material.dart';
import 'package:interviewhatak/layouts/home_layout.dart';
import 'package:interviewhatak/modules/login_screen/login_screen.dart';
import 'package:interviewhatak/modules/on_boarding/on_boarding.dart';
import 'package:interviewhatak/shared/components/components.dart';
import 'package:interviewhatak/shared/components/constants.dart';
import 'package:interviewhatak/shared/data/cache_helper.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

late Widget widget;

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Text(
              'Interviewhatak',
              style: TextStyle(
                color: Color(0xff472723),
                fontSize: 40.0,
                fontFamily: 'Philosopher',
                fontStyle: FontStyle.italic,
              ),
            ),
            SizedBox(
              height: 15.0,
            ),
            Text(
              'Prepare, Inspire, Be ready',
              style: TextStyle(
                fontSize: 18.0,
                color: Color(0xff472723),
                fontWeight: FontWeight.w600,
                fontFamily: 'Poppins',
              ),
            ),
          ],
        ),
      ),
    );
  } //end build()

  var isBoarding = CacheHelper.getData(key: 'onBoarding');

  Future navigateToHome() async {
    await Future.delayed(const Duration(seconds: 5), () {});
    if (isBoarding != null) {
      if (uId != null) {
        widget = const HomeLayout();
      } else {
        widget = const OnBoardingScreen();
        print(uId);
      }
    } else {
      widget = const OnBoardingScreen();
    }
  } //end _navigateToHome()

  @override
  void initState() {
    super.initState();
    navigateToHome().then((value) {
      navigateAndFinish(context, widget);
    });
  } //end initState()
} //end class
