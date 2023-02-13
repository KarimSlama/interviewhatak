import 'package:flutter/material.dart';
import 'package:interviewhatak/shared/components/constants.dart';

class BooksScreen extends StatelessWidget {
  const BooksScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        children: [
          const Image(
              image: NetworkImage(
                  'https://img.freepik.com/free-vector/all-data-concept-illustration_114360-7524.jpg?w=740&t=st=1676314312~exp=1676314912~hmac=a1bd1ac2a844a3cf0516a009c816308048379814dda1a5a3c655d59da82cd310')),
          const SizedBox(
            height: 16.0,
          ),
          Text(
            textAlign: TextAlign.center,
            'we have been working to make that available as soon as possible',
            style: TextStyle(
              color: mainColor,
              fontSize: 22.0,
              fontFamily: 'Philosopher',
            ),
          ),
        ],
      ),
    ));
  }
}
