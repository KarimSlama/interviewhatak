import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:interview/modules/login_screen/login_screen.dart';
import 'package:interview/shared/components/components.dart';
import 'package:interview/shared/components/constants.dart';
import 'package:interview/shared/cubit/cubit/login_cubit.dart';
import 'package:interview/shared/cubit/states/login_state.dart';
import 'package:interview/styles/icon_broken.dart';

class ForgotPasswordScreen extends StatelessWidget {
  const ForgotPasswordScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginCubit(),
      child: BlocConsumer<LoginCubit, LoginStates>(
        listener: (context, state) {},
        builder: (context, state) {
          var emailController = TextEditingController();
          var formKey = GlobalKey<FormState>();
          return Scaffold(
            appBar: AppBar(
              title: Text(
                'Forgot Password',
                style: TextStyle(color: mainColor, fontSize: 18.0),
              ),
              leading: IconButton(
                onPressed: () {
                  navigateAndFinish(context, const LoginScreen());
                },
                icon: Icon(
                  IconBroken.Arrow___Left_2,
                  color: mainColor,
                ),
              ),
            ),
            body: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Center(
                child: SingleChildScrollView(
                  child: Form(
                    key: formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Enter Email Address',
                          style: TextStyle(
                            color: mainColor,
                            fontSize: 18.0,
                          ),
                        ),
                        const SizedBox(
                          height: 28.0,
                        ),
                        Material(
                          elevation: 10.0,
                          shadowColor: Colors.grey[200],
                          borderRadius: BorderRadiusDirectional.circular(20.0),
                          color: Colors.white,
                          child: TextFormField(
                            controller: emailController,
                            keyboardType: TextInputType.emailAddress,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'email is required';
                              }
                              return null;
                            },
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
                          height: 40.0,
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
                                LoginCubit.getContext(context).resetPassword(
                                  email: emailController.text,
                                );
                              }
                            },
                            child: const Text(
                              'SEND',
                              style: TextStyle(
                                  color: Colors.white, fontSize: 16.0),
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
