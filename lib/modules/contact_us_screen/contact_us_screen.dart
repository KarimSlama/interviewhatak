import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:interviewhatak/layouts/home_layout.dart';
import 'package:interviewhatak/shared/components/components.dart';
import 'package:interviewhatak/shared/components/constants.dart';
import 'package:interviewhatak/shared/cubit/cubit/home_cubit.dart';
import 'package:interviewhatak/shared/cubit/states/home_state.dart';
import 'package:interviewhatak/styles/icon_broken.dart';
import 'package:url_launcher/url_launcher_string.dart';

class ContactUsScreen extends StatelessWidget {
  const ContactUsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var nameController = TextEditingController();
    var emailController = TextEditingController();
    var messageController = TextEditingController();
    var formKey = GlobalKey<FormState>();

    return BlocConsumer<HomeCubit, HomeState>(
      listener: (context, state) {
        if (state is ContactMessageSuccessState) {
          nameController.text = '';
          emailController.text = '';
          messageController.text = '';
          var snackBar = SnackBar(
            content: const Text(
              'Thanks for reach out us we will work on your comment as soon as possible.',
            ),
            backgroundColor: mainColor,
            duration: const Duration(seconds: 3),
            action: SnackBarAction(
              onPressed: () {},
              label: 'Undo',
              textColor: Colors.white,
            ),
          );
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        }
      },
      builder: (context, state) {
        return Form(
          key: formKey,
          child: Scaffold(
            appBar: AppBar(
              titleSpacing: 0,
              title: Text('Contact Us', style: TextStyle(color: mainColor)),
              leading: IconButton(
                onPressed: () {
                  navigateTo(context, const HomeLayout());
                },
                icon: Icon(
                  IconBroken.Arrow___Left_2,
                  color: mainColor,
                ),
              ),
            ),
            body: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 30.0),
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Have a Project in mind ?',
                      style: TextStyle(
                          color: mainColor,
                          fontSize: 20.0,
                          fontWeight: FontWeight.w600),
                    ),
                    const SizedBox(
                      height: 14.0,
                    ),
                    Text(
                      'Reach out to us. We can make something awesome together.',
                      style: TextStyle(
                        color: mainColor,
                        height: 1.7,
                      ),
                    ),
                    const SizedBox(
                      height: 40.0,
                    ),
                    Material(
                      elevation: 5.0,
                      shadowColor: Colors.grey[200],
                      borderRadius: BorderRadiusDirectional.circular(20.0),
                      color: Colors.white,
                      child: TextFormField(
                        controller: nameController,
                        keyboardType: TextInputType.text,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'your name is required';
                          }
                          return null;
                        },
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
                      elevation: 5.0,
                      shadowColor: Colors.grey[200],
                      borderRadius: BorderRadiusDirectional.circular(20.0),
                      color: Colors.white,
                      child: TextFormField(
                        controller: emailController,
                        keyboardType: TextInputType.emailAddress,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'your email is required';
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
                      height: 20.0,
                    ),
                    Material(
                      elevation: 5.0,
                      shadowColor: Colors.grey[200],
                      borderRadius: BorderRadiusDirectional.circular(20.0),
                      color: Colors.white,
                      child: TextFormField(
                        controller: messageController,
                        keyboardType: TextInputType.text,
                        maxLines: null,
                        minLines: 1,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'your message is required';
                          }
                          return null;
                        },
                        decoration: const InputDecoration(
                          hintText: 'message',
                          prefixIcon: Icon(
                            IconBroken.Bag,
                          ),
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    Container(
                      height: 35.0,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadiusDirectional.circular(50.0),
                        color: mainColor,
                      ),
                      child: MaterialButton(
                        onPressed: () {
                          if (formKey.currentState!.validate()) {
                            HomeCubit.getContext(context).contactMessages(
                              userName: nameController.text,
                              email: emailController.text,
                              message: messageController.text,
                              messageTime: DateTime.now().toString(),
                            );
                          }
                        },
                        child: const Text(
                          'send',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    Text(
                      'More Info.',
                      style: TextStyle(
                        decoration: TextDecoration.underline,
                        color: mainColor,
                        fontSize: 18.0,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(
                      height: 30.0,
                    ),
                    Row(
                      children: [
                        Icon(
                          IconBroken.Location,
                          color: mainColor,
                        ),
                        const SizedBox(
                          width: 10.0,
                        ),
                        Text(
                          'Egypt, Cairo',
                          style: TextStyle(
                              color: mainColor, fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    Row(
                      children: [
                        Icon(
                          IconBroken.Call,
                          color: mainColor,
                        ),
                        const SizedBox(
                          width: 10.0,
                        ),
                        Text(
                          '+2 01095856941',
                          style: TextStyle(
                              color: mainColor, fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    Row(
                      children: [
                        Icon(
                          IconBroken.Message,
                          color: mainColor,
                        ),
                        const SizedBox(
                          width: 10.0,
                        ),
                        SelectableText(
                          'karimslama917@gmail.com',
                          style: TextStyle(
                            color: mainColor,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    InkWell(
                      onTap: () {
                        launchUrlString(
                            'https://www.linkedin.com/in/karim-slama-');
                      },
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Icon(
                            IconBroken.Tick_Square,
                            color: mainColor,
                          ),
                          const SizedBox(
                            width: 10.0,
                          ),
                          Container(
                            width: 280.0,
                            child: Text(
                              'https://www.linkedin.com/in/karim-slama-',
                              style: TextStyle(
                                color: mainColor,
                                fontWeight: FontWeight.w500,
                              ),
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'developed by',
                          style: TextStyle(color: mainColor),
                        ),
                        TextButton(
                          onPressed: () {
                            launchUrlString(
                                'https://www.linkedin.com/in/karim-slama-');
                          },
                          child: Text(
                            'karim slama',
                            style: TextStyle(
                              color: secondColor,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
