import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:interviewhatak/models/field_model.dart';
import 'package:interviewhatak/shared/components/constants.dart';
import 'package:interviewhatak/shared/cubit/cubit/home_cubit.dart';
import 'package:interviewhatak/shared/cubit/states/home_state.dart';
import 'package:interviewhatak/styles/icon_broken.dart';

class QuestionsScreen extends StatelessWidget {
  final FieldModel fieldModel;

  const QuestionsScreen({Key? key, required this.fieldModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeState>(
      listener: (context, state) {},
      builder: (context, state) {
        return ConditionalBuilder(
          condition: HomeCubit.getContext(context).questionModel != null,
          builder: (context) {
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
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16.0,
                    vertical: 16.0,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Align(
                        alignment: AlignmentDirectional.centerStart,
                        child: Text(
                          '${fieldModel.fieldName}',
                          style: TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.w600,
                            color: mainColor,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 7.0,
                      ),
                      Align(
                        alignment: AlignmentDirectional.centerStart,
                        child: Text(
                          '${fieldModel.fieldDescription}',
                          style: const TextStyle(
                            fontSize: 16.0,
                            color: Colors.grey,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 14.0,
                      ),
                      Container(
                        height: 1,
                        width: 300.0,
                        color: Colors.grey.shade100,
                      ),
                      const SizedBox(
                        height: 14.0,
                      ),
                      ListView.separated(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemBuilder: (context, index) => buildQuestionsList(context, index),
                        separatorBuilder: (context, index) => const SizedBox(
                          height: 16.0,
                        ),
                        itemCount:
                            HomeCubit.getContext(context).questions.length,
                      ),
                    ],
                  ),
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

  Widget buildQuestionsList(context, index) => Material(
        elevation: 5.0,
        borderRadius: BorderRadiusDirectional.circular(12.0),
        child: Container(
          width: double.infinity,
          child: Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 10.0, vertical: 7.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
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
                      width: 274.0,
                      child: SelectableText(
                        '${HomeCubit.getContext(context).questions[index].question}',
                        style: TextStyle(
                          color: mainColor,
                          fontWeight: FontWeight.w600,
                          height: 1.6,
                          fontSize: 15.0,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10.0,
                ),
                SelectableText(
                  '${HomeCubit.getContext(context).questions[index].answer}',
                  style: TextStyle(
                    color: mainColor.withOpacity(.7),
                    height: 1.6,
                    fontSize: 15.0,
                  ),
                ),
                const SizedBox(
                  height: 7.0,
                ),
                if (HomeCubit.getContext(context).questionModel!.subAnswer !=
                        '' ||
                    HomeCubit.getContext(context).questionModel!.firstImage !=
                        '' ||
                    HomeCubit.getContext(context).questionModel!.secondImage !=
                        '')
                  Text(
                    'Example',
                    style: TextStyle(
                        decoration: TextDecoration.underline,
                        color: mainColor,
                        fontWeight: FontWeight.w700),
                  ),
                const SizedBox(
                  height: 12.0,
                ),
                if (HomeCubit.getContext(context).questionModel!.firstImage !=
                    '')
                  Container(
                    width: double.infinity,
                    height: 150.0,
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadiusDirectional.all(
                        Radius.circular(10.0),
                      ),
                      image: DecorationImage(
                        image: NetworkImage(
                          '${HomeCubit.getContext(context).questions[index].firstImage}',
                        ),
                      ),
                    ),
                  ),
                if (HomeCubit.getContext(context).questionModel!.subAnswer !=
                    '')
                  SelectableText(
                    '${HomeCubit.getContext(context).questions[index].subAnswer}',
                    style: TextStyle(
                      color: mainColor.withOpacity(.7),
                      height: 1.6,
                      fontStyle: FontStyle.italic,
                      fontSize: 15.0,
                    ),
                  ),
                if (HomeCubit.getContext(context).questionModel!.secondImage !=
                    '')
                  Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadiusDirectional.all(
                        Radius.circular(10.0),
                      ),
                      image: DecorationImage(
                        image: NetworkImage(
                          '${HomeCubit.getContext(context).questions[index].secondImage}',
                        ),
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ),
      );
}
