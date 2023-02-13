import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:interviewhatak/shared/components/constants.dart';
import 'package:interviewhatak/shared/cubit/cubit/home_cubit.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var searchController = TextEditingController();
    return Scaffold(
      appBar: AppBar(),
      body: Column(
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
            onFieldSubmitted: (value) {},
            onChanged: (value) {
              // StreamBuilder(
              //   stream: (value != '' && value.isNotEmpty)
              //       ? FirebaseFirestore.instance
              //           .collection('categories')
              //           .doc(HomeCubit.getContext(context)
              //               .categoryModel!
              //               .categoryName)
              //           .collection('fields')
              //           .doc(
              //               HomeCubit.getContext(context).fieldModel!.fieldName)
              //           .where(
              //               HomeCubit.getContext(context)
              //                   .questionModel!
              //                   .question,
              //               isNotEqualTo: value)
              //           .orderBy('fields')
              //           .startAt([
              //           value,
              //         ]).endAt([
              //           '$value\uf8ff',
              //         ]).snapshots()
              //       : FirebaseFirestore.instance
              //           .collection('categories')
              //           .snapshots(),
              //   builder: (context, snapshot) {
              //     if (snapshot.connectionState == ConnectionState.waiting &&
              //         snapshot.hasData != true) {
              //       return Center(
              //         child: SpinKitSpinningLines(
              //           size: 40.0,
              //           color: mainColor,
              //         ),
              //       );
              //     } else {
              //       return Text('data');
              //     }
              //   },
              // );
            },
          ),
        ],
      ),
    );
  }
}
