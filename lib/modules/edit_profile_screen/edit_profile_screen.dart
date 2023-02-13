import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:icon_broken/icon_broken.dart';
import 'package:interviewhatak/layouts/home_layout.dart';
import 'package:interviewhatak/shared/components/components.dart';
import 'package:interviewhatak/shared/components/constants.dart';
import 'package:interviewhatak/shared/cubit/cubit/home_cubit.dart';
import 'package:interviewhatak/shared/cubit/states/home_state.dart';

class EditProfileScreen extends StatelessWidget {
  const EditProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var nameController = TextEditingController();
    var emailController = TextEditingController();
    var phoneController = TextEditingController();

    return BlocConsumer<HomeCubit, HomeState>(
      listener: (context, state) {},
      builder: (context, state) {
        var editProfileCubit = HomeCubit.getContext(context).userModel;
        nameController.text = editProfileCubit!.userName!;
        emailController.text = editProfileCubit.email!;
        phoneController.text = editProfileCubit.phone!;
        return Scaffold(
          appBar: AppBar(
            leading: IconButton(
                onPressed: () {
                  navigateTo(context, const HomeLayout());
                },
                icon: Icon(
                  IconBroken.Arrow___Left_2,
                  color: mainColor,
                )),
            title: Text('Edit Profile', style: TextStyle(color: mainColor)),
            centerTitle: true,
          ),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 40.0,
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
                        hintText: 'email-address',
                        prefixIcon: Icon(
                          IconBroken.Message,
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
                    height: 50.0,
                  ),
                  Container(
                    width: 250.0,
                    height: 55.0,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadiusDirectional.circular(50.0),
                      color: mainColor,
                    ),
                    child: MaterialButton(
                      onPressed: () {
                        if (editProfileCubit != null) {
                          HomeCubit.getContext(context).updateUserData(
                            userName: nameController.text,
                            email: emailController.text,
                            phone: phoneController.text,
                          );
                        }
                        Navigator.pop(context);
                      },
                      child: const Text('Confirm Changes',
                          style:
                              TextStyle(fontSize: 16.0, color: Colors.white)),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
