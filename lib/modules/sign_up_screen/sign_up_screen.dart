import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:interviewhatak/layouts/home_layout.dart';
import 'package:interviewhatak/modules/login_screen/login_screen.dart';
import 'package:interviewhatak/shared/components/components.dart';
import 'package:interviewhatak/shared/components/constants.dart';
import 'package:interviewhatak/shared/cubit/cubit/sign_up_cubit.dart';
import 'package:interviewhatak/shared/cubit/states/sign_up_state.dart';
import 'package:interviewhatak/shared/data/cache_helper.dart';
import 'package:interviewhatak/styles/icon_broken.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var nameController = TextEditingController();
    var emailController = TextEditingController();
    var passwordController = TextEditingController();
    var phoneController = TextEditingController();
    var formKey = GlobalKey<FormState>();

    return BlocProvider(
      create: (context) => SignUpCubit(),
      child: BlocConsumer<SignUpCubit, SignUpStates>(
        listener: (context, state) {
          if (state is SignUpCreateUserSuccessState) {
            CacheHelper.saveData(key: 'uId', value: state.uId).then((value) {
              navigateAndFinish(context, const HomeLayout());
            });
            uId = CacheHelper.getData(key: 'uId');
          }
          if (state is SignUpCreateUserErrorState) {
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
                  child: Form(
                    key: formKey,
                    child: Column(
                      children: [
                         Text(
                          'Sign Up',
                          style: TextStyle(
                            fontSize: 35.0,
                            color: mainColor,
                          ),
                        ),
                        const SizedBox(
                          height: 10.0,
                        ),
                        const Text(
                          'create a new profile',
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
                            controller: nameController,
                            keyboardType: TextInputType.text,
                            decoration: const InputDecoration(
                              hintText: 'user-name',
                              prefixIcon: Icon(
                                IconBroken.Profile,
                              ),
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 20.0,
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
                              hintText: 'email-address',
                              prefixIcon: Icon(
                                IconBroken.Message,
                              ),
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 20.0,
                        ),
                        Material(
                          elevation: 10.0,
                          shadowColor: Colors.grey[200],
                          borderRadius: BorderRadiusDirectional.circular(20.0),
                          color: Colors.white,
                          child: TextFormField(
                            controller: passwordController,
                            obscureText:
                                SignUpCubit.getContext(context).isPassword,
                            keyboardType: TextInputType.text,
                            decoration: InputDecoration(
                              hintText: 'password',
                              prefixIcon: const Icon(
                                IconBroken.Password,
                              ),
                              suffixIcon: IconButton(
                                  onPressed: () {
                                    SignUpCubit.getContext(context)
                                        .changePasswordVisibility();
                                  },
                                  icon: Icon(
                                    SignUpCubit.getContext(context).suffixIcon,
                                  )),
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 20.0,
                        ),
                        Material(
                          elevation: 10.0,
                          shadowColor: Colors.grey[200],
                          borderRadius: BorderRadiusDirectional.circular(20.0),
                          color: Colors.white,
                          child: TextFormField(
                            controller: phoneController,
                            keyboardType: TextInputType.phone,
                            decoration: const InputDecoration(
                              hintText: 'phone',
                              prefixIcon: Icon(
                                IconBroken.Calling,
                              ),
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
                            borderRadius:
                                BorderRadiusDirectional.circular(20.0),
                            color: const Color(0xffA68966),
                          ),
                          child: MaterialButton(
                            onPressed: () {
                              if (formKey.currentState!.validate()) {
                                SignUpCubit.getContext(context).createNewUser(
                                  userName: nameController.text,
                                  email: emailController.text,
                                  password: passwordController.text,
                                  phone: phoneController.text,
                                );
                              }
                            },
                            child: const Text(
                              'Sign Up',
                              style: TextStyle(
                                  color: Colors.white, fontSize: 16.0),
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
                            borderRadius:
                                BorderRadiusDirectional.circular(20.0),
                            color: Colors.white,
                            child: MaterialButton(
                              onPressed: () {},
                              child:  Text(
                                'sign up with phone',
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
                            borderRadius:
                                BorderRadiusDirectional.circular(20.0),
                            color: mainColor,
                            child: MaterialButton(
                              onPressed: () {},
                              child: const Text(
                                'sign up with Google',
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
                                builder: (context) => const LoginScreen(),
                              ),
                            );
                          },
                          child:  Text(
                            'already have an account ?',
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
            ),
          );
        },
      ),
    );
  }
}
