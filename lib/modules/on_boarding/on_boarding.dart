import 'package:flutter/material.dart';
import 'package:interviewhatak/modules/login_screen/login_screen.dart';
import 'package:interviewhatak/shared/components/components.dart';
import 'package:interviewhatak/shared/components/constants.dart';
import 'package:interviewhatak/shared/data/cache_helper.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  var pageController = PageController();

  List<BoardingModel> boarding = [
    BoardingModel(
      image: 'assets/images/interview_1.jpg',
      title: 'Prepare, inspire yourself',
      body:
          'Inteviewhatak app make you aware of many matters related to your field.',
    ),
    BoardingModel(
      image: 'assets/images/interview_2.jpg',
      title: 'Be sure of yourself',
      body:
          'Inteviewhatak app will trust you through practice with more questions.',
    ),
    BoardingModel(
      image: 'assets/images/interview_3.jpg',
      title: 'Receive an offer to work',
      body:
          'Interviewhatak app will enable you to get the work you wish to get throughout the time.',
    ),
  ];

  bool isLast = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          TextButton(
              onPressed: () {
                submit();
              },
              child: Text(
                'skip',
                style: TextStyle(
                  color: secondColor,
                  fontSize: 18.0,
                ),
              )),
        ],
      ),
      body: Column(
        children: [
          Container(
            width: double.infinity,
            height: 570.0,
            child: PageView.builder(
              onPageChanged: (value) {
                if (value == boarding.length - 1) {
                  setState(() {
                    isLast = true;
                  });
                } else {
                  setState(() {
                    isLast = false;
                  });
                }
              },
              controller: pageController,
              physics: const BouncingScrollPhysics(),
              itemBuilder: (context, index) =>
                  buildBoardingItems(boarding[index]),
              itemCount: boarding.length,
            ),
          ),
          const SizedBox(
            height: 15.0,
          ),
          SmoothPageIndicator(
            controller: pageController,
            count: boarding.length,
            effect: ExpandingDotsEffect(
                dotWidth: 12.0,
                dotHeight: 12.0,
                spacing: 5.0,
                expansionFactor: 3.0,
                dotColor: mainColor,
                activeDotColor: secondColor),
          ),
          const SizedBox(
            height: 20.0,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                  onPressed: () {
                    if (isLast) {
                      submit();
                    }
                    pageController.nextPage(
                      duration: const Duration(seconds: 1),
                      curve: Curves.fastLinearToSlowEaseIn,
                    );
                  },
                  child: isLast
                      ? Text(
                          'start',
                          style: TextStyle(
                            color: secondColor,
                            fontSize: 18.0,
                          ),
                        )
                      : Text(
                          'next',
                          style: TextStyle(
                            color: secondColor,
                            fontSize: 18.0,
                          ),
                        ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  } //end build()

  void submit() {
    CacheHelper.saveData(key: 'onBoarding', value: true).then((value) {
      if (value!) navigateAndFinish(context, const LoginScreen());
    });
  }

  Widget buildBoardingItems(BoardingModel model) => Padding(
        padding: const EdgeInsets.all(14.0),
        child: Column(
          children: [
            Image(
              image: AssetImage(model.image),
              width: double.infinity,
              height: 400.0,
            ),
            const SizedBox(
              height: 15.0,
            ),
            Text(
              model.title,
              style: const TextStyle(
                fontSize: 24.0,
                fontStyle: FontStyle.italic,
                fontWeight: FontWeight.w600,
                fontFamily: 'Philosopher',
                color: Colors.black,
              ),
            ),
            const SizedBox(
              height: 12.0,
            ),
            Text(
              model.body,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 18.0,
                color: Colors.black,
              ),
            ),
          ],
        ),
      );
} //end class

class BoardingModel {
  final String image;
  final String title;
  final String body;

  BoardingModel({
    required this.image,
    required this.title,
    required this.body,
  });
}
