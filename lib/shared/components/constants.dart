import 'package:flutter/material.dart';
import 'package:interviewhatak/modules/login_screen/login_screen.dart';
import 'package:interviewhatak/shared/components/components.dart';
import 'package:interviewhatak/shared/data/cache_helper.dart';

var mainColor = const Color(0xff472723);
var secondColor = const Color(0xffFF725E);

// String? key = '';
String? uId = '';

void logout(context) {
  CacheHelper.removeData(key: 'uId');
  navigateAndFinish(context, const LoginScreen());
}
