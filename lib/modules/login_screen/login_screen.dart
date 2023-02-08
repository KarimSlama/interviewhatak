import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:interview/layouts/home_layout.dart';
import 'package:interview/modules/forgot_password_screen/forgot_password_screen.dart';
import 'package:interview/modules/sign_up_screen/sign_up_screen.dart';
import 'package:interview/shared/components/components.dart';
import 'package:interview/shared/components/constants.dart';
import 'package:interview/shared/cubit/cubit/login_cubit.dart';
import 'package:interview/shared/cubit/states/login_state.dart';
import 'package:interview/shared/data/cache_helper.dart';
import 'package:interview/styles/icon_broken.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var emailController = TextEditingController();
    var passwordController = TextEditingController();
    return BlocProvider(
      create: (context) => LoginCubit(),
      child: BlocConsumer<LoginCubit, LoginStates>(
        listener: (context, state) {
          if (state is LoginSuccessState) {
            CacheHelper.saveData(key: 'uId', value: state.uId).then((value) {
              navigateAndFinish(context, const HomeLayout());
            });
            uId = CacheHelper.getData(key: 'uId');
          }
          if (state is LoginErrorState) {
            Fluttertoast.showToast(
              msg: state.error,
              toastLength: Toast.LENGTH_LONG,
              timeInSecForIosWeb: 5,
            );
          }
        },
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(),
            body: Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Text(
                        'Login',
                        style: TextStyle(
                          fontSize: 35.0,
                          color: mainColor,
                        ),
                      ),
                      const SizedBox(
                        height: 30.0,
                      ),
                      const Text(
                        'login to let yourself ready\nfor any interview',
                        style: TextStyle(
                          fontSize: 20.0,
                          color: Color(0xffBFBEBE),
                          height: 1.6,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(
                        height: 30.0,
                      ),
                      Material(
                        elevation: 10.0,
                        shadowColor: Colors.grey[200],
                        borderRadius: BorderRadiusDirectional.circular(20.0),
                        color: Colors.white,
                        child: TextFormField(
                          controller: emailController,
                          keyboardType: TextInputType.emailAddress,
                          decoration: const InputDecoration(
                            hintText: 'email address',
                            prefixIcon: Icon(
                              IconBroken.Profile,
                            ),
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 30.0,
                      ),
                      Material(
                        elevation: 10.0,
                        shadowColor: Colors.grey[200],
                        borderRadius: BorderRadiusDirectional.circular(20.0),
                        color: Colors.white,
                        child: TextFormField(
                          controller: passwordController,
                          obscureText:
                              LoginCubit.getContext(context).isPassword,
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(
                            hintText: 'password',
                            prefixIcon: const Icon(
                              IconBroken.Password,
                            ),
                            suffixIcon: IconButton(
                                onPressed: () {
                                  LoginCubit.getContext(context)
                                      .changePasswordVisibility();
                                },
                                icon: Icon(
                                  LoginCubit.getContext(context).suffixIcon,
                                )),
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 30.0,
                      ),
                      Container(
                        width: 190.0,
                        height: 50.0,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadiusDirectional.circular(20.0),
                          color: const Color(0xffA68966),
                        ),
                        child: MaterialButton(
                          onPressed: () {
                            LoginCubit.getContext(context).loginUser(
                              email: emailController.text,
                              password: passwordController.text,
                            );
                          },
                          child: const Text(
                            'Login',
                            style:
                                TextStyle(color: Colors.white, fontSize: 16.0),
                          ),
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          navigateTo(context, const ForgotPasswordScreen());
                        },
                        child: Text(
                          'forgot password ?',
                          style: TextStyle(
                            color: mainColor,
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20.0,
                      ),
                      Container(
                        height: 1,
                        width: double.infinity,
                        color: Colors.grey[200],
                      ),
                      const SizedBox(
                        height: 20.0,
                      ),
                      SizedBox(
                        width: double.infinity,
                        height: 50.0,
                        child: Material(
                          elevation: 10.0,
                          shadowColor: Colors.grey[200],
                          borderRadius: BorderRadiusDirectional.circular(20.0),
                          color: Colors.white,
                          child: MaterialButton(
                            onPressed: () {},
                            child: Text(
                              'continue with phone',
                              style:
                                  TextStyle(color: mainColor, fontSize: 16.0),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20.0,
                      ),
                      SizedBox(
                        width: double.infinity,
                        height: 50.0,
                        child: Material(
                          elevation: 10.0,
                          shadowColor: mainColor,
                          borderRadius: BorderRadiusDirectional.circular(20.0),
                          color: mainColor,
                          child: MaterialButton(
                            onPressed: () {},
                            child: const Text(
                              'continue with Google',
                              style: TextStyle(
                                  color: Color(0xffFBF7F2), fontSize: 16.0),
                            ),
                          ),
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const SignUpScreen(),
                            ),
                          );
                        },
                        child: Text(
                          'new user ?',
                          style: TextStyle(
                            color: mainColor,
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
