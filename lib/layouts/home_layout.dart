import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:interviewhatak/modules/search_screen/search_screen.dart';
import 'package:interviewhatak/shared/components/components.dart';
import 'package:interviewhatak/shared/components/constants.dart';
import 'package:interviewhatak/shared/cubit/cubit/home_cubit.dart';
import 'package:interviewhatak/shared/cubit/states/home_state.dart';
import 'package:interviewhatak/styles/icon_broken.dart';

class HomeLayout extends StatelessWidget {
  const HomeLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,
            title: Text(
              HomeCubit.getContext(context)
                  .titles[HomeCubit.getContext(context).currentIndex],
              style: TextStyle(color: mainColor, fontWeight: FontWeight.w500),
            ),
            actions: [
              IconButton(
                onPressed: () {
                  navigateTo(context, const SearchScreen());
                },
                icon: Icon(
                  IconBroken.Search,
                  color: mainColor,
                ),
              ),
              IconButton(
                onPressed: () {},
                icon: Icon(
                  IconBroken.Notification,
                  color: mainColor,
                ),
              ),
            ],
          ),
          body: HomeCubit.getContext(context)
              .screens[HomeCubit.getContext(context).currentIndex],
          bottomNavigationBar: CurvedNavigationBar(
            backgroundColor: const Color(0xffFF725E),
            buttonBackgroundColor: const Color(0xffFF725E),
            index: HomeCubit.getContext(context).currentIndex,
            onTap: (value) {
              HomeCubit.getContext(context).changeBottomNavigation(value);
            },
            items: const [
              Icon(IconBroken.Home),
              Icon(IconBroken.Heart),
              Icon(IconBroken.Bookmark),
              Icon(IconBroken.Profile),
            ],
          ),
        );
      },
    );
  }
}
