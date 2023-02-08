import 'package:flutter/material.dart';
import 'package:interview/layouts/home_layout.dart';
import 'package:interview/shared/components/components.dart';
import 'package:interview/shared/components/constants.dart';
import 'package:interview/styles/icon_broken.dart';

class AboutUsScreen extends StatelessWidget {
  const AboutUsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        titleSpacing: 0.0,
        title:  Text(
          'About Us',
          style: TextStyle(
            color: mainColor,
          ),
        ),
        leading: IconButton(
          onPressed: () {
            navigateTo(context, const HomeLayout());
          },
          icon:  Icon(
            IconBroken.Arrow___Left_2,
            color: mainColor,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              const SizedBox(
                height: 16.0,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Icon(
                    IconBroken.Paper,
                    color: Color(0xffFF725E),
                  ),
                  const SizedBox(
                    width: 16.0,
                  ),
                  Expanded(
                    child: Container(
                      width: double.infinity,
                      child:  Text(
                        'Interviewhatak app is a preparation application for any interview. This app is able to prepare candidates for any interview in the fields of technology.',
                        style: TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.w500,
                          color: mainColor,
                        ),
                      ),
                    ),
                  ),
                  // Text(
                  //   'About Interviewhatak !',
                  //   style: TextStyle(
                  //     fontSize: 18.0,
                  //     color: mainColor,
                  //     fontWeight: FontWeight.w600,
                  //   ),
                  // ),
                ],
              ),
              const SizedBox(
                height: 8.0,
              ),
              Container(
                width: double.infinity,
                height: 1,
                color: Colors.grey[200],
              ),
              const SizedBox(
                height: 8.0,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Icon(
                    IconBroken.Paper,
                    color: Color(0xffFF725E),
                  ),
                  const SizedBox(
                    width: 16.0,
                  ),
                  Expanded(
                    child: Container(
                      width: double.infinity,
                      child:  Text(
                        'Interviewhatak app is a preparation application for any interview. This app is able to prepare candidates for any interview in the fields of technology.',
                        style: TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.w500,
                          color: mainColor,
                        ),
                      ),
                    ),
                  ),
                  // Text(
                  //   'About Interviewhatak !',
                  //   style: TextStyle(
                  //     fontSize: 18.0,
                  //     color: mainColor,
                  //     fontWeight: FontWeight.w600,
                  //   ),
                  // ),
                ],
              ),
              const SizedBox(
                height: 8.0,
              ),
              Container(
                width: double.infinity,
                height: 1,
                color: Colors.grey[200],
              ),
              const SizedBox(
                height: 8.0,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Icon(
                    IconBroken.Paper,
                    color: Color(0xffFF725E),
                  ),
                  const SizedBox(
                    width: 16.0,
                  ),
                  Expanded(
                    child: Container(
                      width: double.infinity,
                      child:  Text(
                        'Interviewhatak app is a preparation application for any interview. This app is able to prepare candidates for any interview in the fields of technology.',
                        style: TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.w500,
                          color: mainColor,
                        ),
                      ),
                    ),
                  ),
                  // Text(
                  //   'About Interviewhatak !',
                  //   style: TextStyle(
                  //     fontSize: 18.0,
                  //     color: mainColor,
                  //     fontWeight: FontWeight.w600,
                  //   ),
                  // ),
                ],
              ),
              const SizedBox(
                height: 8.0,
              ),
              Container(
                width: double.infinity,
                height: 1,
                color: Colors.grey[200],
              ),
              const SizedBox(
                height: 8.0,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Icon(
                    IconBroken.Paper,
                    color: Color(0xffFF725E),
                  ),
                  const SizedBox(
                    width: 16.0,
                  ),
                  Expanded(
                    child: Container(
                      width: double.infinity,
                      child:  Text(
                        'Interviewhatak app is a preparation application for any interview. This app is able to prepare candidates for any interview in the fields of technology.',
                        style: TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.w500,
                          color: mainColor,
                        ),
                      ),
                    ),
                  ),
                  // Text(
                  //   'About Interviewhatak !',
                  //   style: TextStyle(
                  //     fontSize: 18.0,
                  //     color: mainColor,
                  //     fontWeight: FontWeight.w600,
                  //   ),
                  // ),
                ],
              ),
              const SizedBox(
                height: 8.0,
              ),
              Container(
                width: double.infinity,
                height: 1,
                color: Colors.grey[200],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
