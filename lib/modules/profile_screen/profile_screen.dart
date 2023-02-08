import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:icon_broken/icon_broken.dart';
import 'package:interview/modules/about_us/about_us_screen.dart';
import 'package:interview/modules/contact_us_screen/contact_us_screen.dart';
import 'package:interview/modules/edit_profile_screen/edit_profile_screen.dart';
import 'package:interview/modules/setting_screen/setting_screen.dart';
import 'package:interview/shared/components/components.dart';
import 'package:interview/shared/components/constants.dart';
import 'package:interview/shared/cubit/cubit/home_cubit.dart';
import 'package:interview/shared/cubit/states/home_state.dart';
import 'package:quickalert/models/quickalert_type.dart';
import 'package:quickalert/widgets/quickalert_dialog.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeState>(
      listener: (context, state) {},
      builder: (context, state) {
        var profileCubit = HomeCubit.getContext(context).userModel;
        return ConditionalBuilder(
          condition: profileCubit!.image != null,
          builder: (context) {
            return Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 22.0),
                child: Column(
                  children: [
                    const SizedBox(
                      height: 20.0,
                    ),
                    CircleAvatar(
                      radius: 68,
                      backgroundColor: const Color(0xffD5C3AD),
                      child: CircleAvatar(
                        backgroundImage: NetworkImage('${profileCubit.image}'),
                        radius: 65.0,
                      ),
                    ),
                    const SizedBox(
                      height: 14.0,
                    ),
                    Text(
                      '${profileCubit.userName}',
                      style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.w500,
                        color: mainColor,
                      ),
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    Container(
                      width: 180.0,
                      height: 55.0,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadiusDirectional.circular(50.0),
                        color: mainColor,
                      ),
                      child: MaterialButton(
                        onPressed: () {
                          navigateTo(context, const EditProfileScreen());
                        },
                        child: const Text(
                          'Edit Profile',
                          style: TextStyle(fontSize: 16.0, color: Colors.white),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 60.0,
                    ),
                    InkWell(
                      onTap: () {
                        navigateTo(context, const SettingScreen());
                      },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 14.0),
                        child: Row(
                          children: [
                            const Icon(IconBroken.Setting),
                            const SizedBox(
                              width: 15.0,
                            ),
                            Text('Settings',
                                style: TextStyle(color: mainColor)),
                            const Spacer(),
                            const Icon(IconBroken.Arrow___Right_2),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 14.0),
                      child: Row(
                        children: [
                          const Icon(IconBroken.User),
                          const SizedBox(
                            width: 15.0,
                          ),
                          Text('User Management',
                              style: TextStyle(color: mainColor)),
                          const Spacer(),
                          const Icon(IconBroken.Arrow___Right_2),
                        ],
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        navigateTo(context, const AboutUsScreen());
                      },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 14.0),
                        child: Row(
                          children: [
                            const Icon(IconBroken.More_Circle),
                            const SizedBox(
                              width: 15.0,
                            ),
                            Text(
                              'About us',
                              style: TextStyle(color: mainColor),
                            ),
                            const Spacer(),
                            const Icon(IconBroken.Arrow___Right_2),
                          ],
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        navigateTo(context, const ContactUsScreen());
                      },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 14.0),
                        child: Row(
                          children: [
                            const Icon(IconBroken.Chat),
                            const SizedBox(
                              width: 15.0,
                            ),
                            Text(
                              'Contact us',
                              style: TextStyle(color: mainColor),
                            ),
                            const Spacer(),
                            const Icon(IconBroken.Arrow___Right_2),
                          ],
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        QuickAlert.show(
                          context: context,
                          type: QuickAlertType.confirm,
                          text: 'Do you want to logout ?',
                          confirmBtnText: 'Yes',
                          onConfirmBtnTap: () => logout(context),
                          cancelBtnText: 'No',
                          confirmBtnColor: secondColor,
                        );
                      },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 14.0),
                        child: Row(
                          children: [
                            const Icon(IconBroken.Logout),
                            const SizedBox(
                              width: 15.0,
                            ),
                            Text('Logout', style: TextStyle(color: mainColor)),
                            const Spacer(),
                            const Icon(IconBroken.Arrow___Right_2),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
          fallback: (context) => Center(
            child: SpinKitSpinningLines(
              size: 40.0,
              color: mainColor,
            ),
          ),
        );
      },
    );
  }

  Widget alertDialog() => const CupertinoAlertDialog(
        title: Text('Do you want to logout ?'),
        actions: [
          CupertinoDialogAction(
            child: Text('No'),
          ),
          CupertinoDialogAction(
            child: Text('Yes'),
          ),
        ],
      );
}
