import 'dart:io';

import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:interview/layouts/home_layout.dart';
import 'package:interview/shared/components/components.dart';
import 'package:interview/shared/components/constants.dart';
import 'package:interview/shared/cubit/cubit/home_cubit.dart';
import 'package:interview/shared/cubit/states/home_state.dart';
import 'package:interview/styles/icon_broken.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeState>(
      listener: (context, state) {},
      builder: (context, state) {
        var settingCubit = HomeCubit.getContext(context);
        return ConditionalBuilder(
          condition: settingCubit.userModel != null,
          builder: (context) => Scaffold(
            appBar: AppBar(
              leading: IconButton(
                onPressed: () {
                  navigateTo(context, const HomeLayout());
                },
                icon: Icon(
                  IconBroken.Arrow___Left_2,
                  color: mainColor,
                ),
              ),
              titleSpacing: 0.0,
              title: Text(
                'Settings',
                style: TextStyle(color: mainColor),
              ),
              actions: [
                if (settingCubit.profileImage != null)
                  IconButton(
                    onPressed: () {
                      settingCubit.changeProfileImage();
                    },
                    icon: const Icon(
                      IconBroken.Shield_Done,
                    ),
                    color: secondColor,
                    iconSize: 28.0,
                  )
              ],
            ),
            body: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16.0),
                    child: Row(
                      children: [
                        Stack(
                          alignment: AlignmentDirectional.bottomEnd,
                          children: [
                            CircleAvatar(
                              radius: 40,
                              backgroundColor: const Color(0xffD5C3AD),
                              child: CircleAvatar(
                                radius: 37.0,
                                backgroundImage:
                                    settingCubit.profileImage == null
                                        ? NetworkImage(
                                            '${settingCubit.userModel!.image}',
                                          )
                                        : FileImage(
                                            File(HomeCubit.getContext(context)
                                                .profileImage!
                                                .path),
                                          ) as ImageProvider,
                              ),
                            ),
                            CircleAvatar(
                              radius: 15,
                              backgroundColor: Colors.white,
                              child: IconButton(
                                onPressed: () {
                                  settingCubit.pickProfileImage();
                                },
                                icon: const Icon(
                                  IconBroken.Edit,
                                  size: 16.0,
                                  color: Colors.blue,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          width: 12.0,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '${settingCubit.userModel!.userName}',
                              style: TextStyle(
                                fontSize: 17.0,
                                fontWeight: FontWeight.w500,
                                color: mainColor,
                              ),
                            ),
                            Row(
                              children: [
                                Text(
                                  '${settingCubit.userModel!.email}',
                                  style: TextStyle(
                                    fontSize: 14.0,
                                    fontWeight: FontWeight.w500,
                                    color: mainColor,
                                  ),
                                ),
                                IconButton(
                                  onPressed: () {
                                    Clipboard.setData(ClipboardData(
                                            text:
                                                '${settingCubit.userModel!.email}'))
                                        .then((value) {
                                      Fluttertoast.showToast(
                                        msg: 'copied',
                                        toastLength: Toast.LENGTH_SHORT,
                                        timeInSecForIosWeb: 3,
                                        backgroundColor: mainColor,
                                      );
                                    });
                                  },
                                  icon: const Icon(
                                    IconBroken.Paper,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 16.0,
                  ),
                  Material(
                    elevation: 10.0,
                    borderRadius: BorderRadiusDirectional.circular(20.0),
                    child: Container(
                      width: double.infinity,
                      height: 215.0,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Account',
                              style: TextStyle(
                                color: mainColor,
                                fontSize: 16.0,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            const SizedBox(
                              height: 10.0,
                            ),
                            Row(
                              children: [
                                Text(
                                  'Signed in As: ',
                                  style: TextStyle(
                                    color: mainColor,
                                    fontSize: 14.0,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                Text(
                                  '${settingCubit.userModel!.email}',
                                  style: TextStyle(
                                    color: mainColor,
                                    fontSize: 14.0,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 15.0,
                            ),
                            Row(
                              children: [
                                const CircleAvatar(
                                  radius: 25.0,
                                  backgroundColor: Colors.white70,
                                  child: Icon(IconBroken.Calling),
                                ),
                                const SizedBox(
                                  width: 15.0,
                                ),
                                Column(
                                  children: [
                                    Text(
                                      'Mobile Phone',
                                      style: TextStyle(
                                        color: mainColor,
                                        fontSize: 13.0,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 7.0,
                                    ),
                                    Text(
                                      '${settingCubit.userModel!.phone}',
                                      style: const TextStyle(
                                        color: Colors.grey,
                                        fontSize: 13.0,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 9.0,
                            ),
                            Container(
                              width: 200.0,
                              height: 1,
                              color: Colors.grey[200],
                            ),
                            const SizedBox(
                              height: 9.0,
                            ),
                            Row(
                              children: [
                                const CircleAvatar(
                                  radius: 25.0,
                                  backgroundColor: Colors.white70,
                                  child: Icon(Icons.language_outlined),
                                ),
                                const SizedBox(
                                  width: 15.0,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Languages',
                                      style: TextStyle(
                                        color: mainColor,
                                        fontSize: 13.0,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 7.0,
                                    ),
                                    const Text(
                                      'English',
                                      style: TextStyle(
                                        color: Colors.grey,
                                        fontSize: 13.0,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 24.0,
                  ),
                  Material(
                    elevation: 10.0,
                    borderRadius: BorderRadiusDirectional.circular(20.0),
                    child: Container(
                      width: double.infinity,
                      height: 245.0,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Additional',
                              style: TextStyle(
                                color: mainColor,
                                fontSize: 16.0,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            const SizedBox(
                              height: 10.0,
                            ),
                            Row(
                              children: [
                                const CircleAvatar(
                                  radius: 25.0,
                                  backgroundColor: Colors.white70,
                                  child: Icon(Icons.dark_mode_outlined),
                                ),
                                const SizedBox(
                                  width: 15.0,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Theme',
                                      style: TextStyle(
                                        color: mainColor,
                                        fontSize: 13.0,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 7.0,
                                    ),
                                    const Text(
                                      'Light',
                                      style: TextStyle(
                                        color: Colors.grey,
                                        fontSize: 13.0,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 9.0,
                            ),
                            Container(
                              width: 200.0,
                              height: 1,
                              color: Colors.grey[200],
                            ),
                            const SizedBox(
                              height: 9.0,
                            ),
                            Row(
                              children: [
                                const CircleAvatar(
                                  radius: 25.0,
                                  backgroundColor: Colors.white70,
                                  child: Icon(IconBroken.Notification),
                                ),
                                const SizedBox(
                                  width: 15.0,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Notification',
                                      style: TextStyle(
                                        color: mainColor,
                                        fontSize: 13.0,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 7.0,
                                    ),
                                    const Text(
                                      'Enabled',
                                      style: TextStyle(
                                        color: Colors.grey,
                                        fontSize: 13.0,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 9.0,
                            ),
                            Container(
                              width: 200.0,
                              height: 1,
                              color: Colors.grey[200],
                            ),
                            const SizedBox(
                              height: 9.0,
                            ),
                            Row(
                              children: [
                                const CircleAvatar(
                                  radius: 25.0,
                                  backgroundColor: Colors.white70,
                                  child: Icon(IconBroken.Close_Square),
                                ),
                                const SizedBox(
                                  width: 15.0,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Close Account',
                                      style: TextStyle(
                                        color: mainColor,
                                        fontSize: 13.0,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 7.0,
                                    ),
                                    const Text(
                                      'close account from google play',
                                      style: TextStyle(
                                        color: Colors.grey,
                                        fontSize: 13.0,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
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
}
