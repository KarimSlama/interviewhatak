import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:interviewhatak/shared/components/constants.dart';
import 'package:interviewhatak/shared/cubit/cubit/home_cubit.dart';
import 'package:interviewhatak/styles/icon_broken.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

var searchController = TextEditingController();

class _SearchScreenState extends State<SearchScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            IconBroken.Arrow___Left_2,
            color: mainColor,
          ),
        ),
        titleSpacing: 0.0,
        title: Text(
          'Search..?',
          style: TextStyle(color: mainColor),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
        child: Column(
          children: [
            TextFormField(
              keyboardType: TextInputType.text,
              controller: searchController,
              validator: (value) {},
              style: TextStyle(
                color: secondColor,
                fontWeight: FontWeight.normal,
              ),
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15.0),
                  borderSide: const BorderSide(color: Colors.white, width: 1.0),
                ),
                fillColor: Colors.white,
                labelText: 'Search',
                labelStyle: TextStyle(
                  color: mainColor,
                  fontSize: 16.0,
                ),
              ),
              onChanged: (value) {
              },
            ),
          ],
        ),
      ),
    );
  }
}
