import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:interviewhatak/modules/spalsh_screen/splash_screen.dart';
import 'package:interviewhatak/shared/cubit/cubit/home_cubit.dart';
import 'package:interviewhatak/shared/cubit/observer.dart';
import 'package:interviewhatak/shared/data/cache_helper.dart';
import 'package:interviewhatak/styles/theme.dart';

import 'shared/components/constants.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  await Firebase.initializeApp();
  await CacheHelper.init();
  uId = CacheHelper.getData(key: 'uId');
  print(uId);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit()
        ..getUserData()
        ..getCategoriesItems(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: const SplashScreen(),
        theme: lightTheme,
      ),
    );
  } //end build()
} //end class
