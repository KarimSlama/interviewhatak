import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:interview/models/field_model.dart';
import 'package:interview/shared/components/constants.dart';
import 'package:interview/shared/cubit/cubit/home_cubit.dart';
import 'package:interview/shared/cubit/states/home_state.dart';
import 'package:interview/styles/icon_broken.dart';

class QuestionsScreen extends StatelessWidget {
  final FieldModel fieldModel;

  const QuestionsScreen({Key? key, required this.fieldModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeState>(
      listener: (context, state) {},
      builder: (context, state) {
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
              'Overview',
              style: TextStyle(color: mainColor),
            ),
          ),
          body: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '${fieldModel.fieldName}',
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.w600,
                      color: mainColor,
                    ),
                  ),
                  const SizedBox(
                    height: 7.0,
                  ),
                  Text(
                    '${fieldModel.fieldDescription}',
                    style: const TextStyle(
                      fontSize: 16.0,
                      color: Colors.grey,
                    ),
                  ),
                  const SizedBox(
                    height: 26.0,
                  ),
                  ListView.separated(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemBuilder: (context, index) => buildQuestionsList(),
                    separatorBuilder: (context, index) => const SizedBox(
                      height: 16.0,
                    ),
                    itemCount: 20,
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget buildQuestionsList() => Material(
        elevation: 5.0,
        borderRadius: BorderRadiusDirectional.circular(12.0),
        child: Container(
          width: double.infinity,
          child: Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 10.0, vertical: 7.0),
            child: Column(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Icon(
                      IconBroken.Bag,
                      color: secondColor,
                    ),
                    const SizedBox(
                      width: 10.0,
                    ),
                    SizedBox(
                      width: 210.0,
                      child: SelectableText(
                        'Do you know me ?',
                        style: TextStyle(
                          color: mainColor,
                          fontWeight: FontWeight.w600,
                          fontSize: 16.0,
                        ),
                      ),
                    ),
                    const Spacer(),
                    IconButton(
                      padding: EdgeInsetsDirectional.zero,
                      onPressed: () {},
                      icon: const Icon(
                        IconBroken.Heart,
                        color: Colors.grey,
                      ),
                    )
                  ],
                ),
                SelectableText(
                  'Yeah you are karim slama the developer of this app',
                  style: TextStyle(
                    color: mainColor.withOpacity(.7),
                    height: 1.6,
                    fontSize: 16.0,
                  ),
                ),
                const SizedBox(
                  height: 7.0,
                ),
              ],
            ),
          ),
        ),
      );
}
