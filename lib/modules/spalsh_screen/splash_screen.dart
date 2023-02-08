import 'package:flutter/material.dart';
import 'package:interview/layouts/home_layout.dart';
import 'package:interview/modules/login_screen/login_screen.dart';
import 'package:interview/shared/components/components.dart';
import 'package:interview/shared/components/constants.dart';

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

  Future navigateToHome() async {
    await Future.delayed(const Duration(seconds: 5), () {});
    if (uId != null) {
      widget = const HomeLayout();
    } else {
      widget = const LoginScreen();
      print(uId);
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
