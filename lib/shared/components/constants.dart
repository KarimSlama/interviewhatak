import 'package:flutter/material.dart';
import 'package:interview/modules/login_screen/login_screen.dart';
import 'package:interview/shared/components/components.dart';
import 'package:interview/shared/data/cache_helper.dart';

var mainColor = const Color(0xff472723);
var secondColor = const Color(0xffFF725E);

// String? key = '';
String? uId = '';

void logout(context) {
  CacheHelper.removeData(key: 'uId');
  navigateAndFinish(context, const LoginScreen());
}
