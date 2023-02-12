import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:interview/models/field_model.dart';
import 'package:interview/models/section_model.dart';
import 'package:interview/modules/questions_screen/questions_screen.dart';
import 'package:interview/shared/components/components.dart';
import 'package:interview/shared/components/constants.dart';
import 'package:interview/shared/cubit/cubit/home_cubit.dart';
import 'package:interview/shared/cubit/states/home_state.dart';
import 'package:interview/styles/icon_broken.dart';

class SectionsScreen extends StatelessWidget {
  final FieldModel fieldModel;

  const SectionsScreen({Key? key, required this.fieldModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeState>(
      listener: (context, state) {},
      builder: (context, state) {
        return ConditionalBuilder(
          condition: HomeCubit.getContext(context).fieldModel != null,
          builder: (context) {
            return Scaffold(
              appBar: AppBar(
                title: Text(
                  fieldModel.fieldName!,
                  style: TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.w600,
                    color: mainColor,
                  ),
                ),
                titleSpacing: 0,
                leading: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(
                    IconBroken.Arrow___Left_2,
                    color: mainColor,
                  ),
                ),
              ),
              body: Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 16.0, vertical: 16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '${fieldModel.fieldDescription}',
                      style: TextStyle(fontSize: 16.0, color: mainColor),
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    Expanded(
                      child: GridView.count(
                        physics: const BouncingScrollPhysics(),
                        crossAxisCount: 2,
                        mainAxisSpacing: 1.0,
                        crossAxisSpacing: 1.0,
                        childAspectRatio: 1 / 1.3,
                        children: List.generate(
                          HomeCubit.getContext(context).sections.length,
                          (index) => buildItem(
                              fieldModel,
                              HomeCubit.getContext(context).sections[index],
                              context,
                              index),
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

  Widget buildItem(
          FieldModel fieldModel, SectionModel sectionModel, context, index) =>
      InkWell(
        onTap: () {
          HomeCubit.getContext(context).getQuestionsItems(
            categoryName: fieldModel.categoryName!,
            fieldName: fieldModel.fieldName!,
            sectionName: sectionModel.sectionName!,
          );
          navigateTo(context, QuestionsScreen(fieldModel: fieldModel));
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              children: [
                Container(
                  width: 150.0,
                  height: 160.0,
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadiusDirectional.only(
                        topStart: Radius.circular(20.0),
                        bottomEnd: Radius.circular(20.0)),
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(
                        '${HomeCubit.getContext(context).sections[index].image}',
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10.0,
                ),
                Text(
                  '${HomeCubit.getContext(context).sections[index].sectionName}',
                  style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.w600,
                      color: mainColor),
                ),
              ],
            ),
          ],
        ),
      );
}
