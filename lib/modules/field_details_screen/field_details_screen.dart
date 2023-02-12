import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:icon_broken/icon_broken.dart';
import 'package:interview/layouts/home_layout.dart';
import 'package:interview/models/category_model.dart';
import 'package:interview/models/field_model.dart';
import 'package:interview/modules/sections_screen/sections_screen.dart';
import 'package:interview/shared/components/components.dart';
import 'package:interview/shared/components/constants.dart';
import 'package:interview/shared/cubit/cubit/home_cubit.dart';
import 'package:interview/shared/cubit/states/home_state.dart';

class FieldDetailsScreen extends StatelessWidget {
  final CategoryModel categoryModel;

  const FieldDetailsScreen({Key? key, required this.categoryModel})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeState>(
      listener: (context, state) {},
      builder: (context, state) {
        return ConditionalBuilder(
          condition: HomeCubit.getContext(context).fields.isNotEmpty,
          builder: (context) {
            return Scaffold(
              backgroundColor: Colors.white,
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
                  '${categoryModel.categoryName}',
                  style: TextStyle(color: mainColor),
                ),
              ),
              body: Padding(
                padding: const EdgeInsets.symmetric(vertical: 20.0),
                child: Column(
                  children: [
                    Expanded(
                      child: SingleChildScrollView(
                        physics: const BouncingScrollPhysics(),
                        child: ListView.separated(
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            return buildFieldsItems(
                                categoryModel,
                                HomeCubit.getContext(context).fields[index],
                                context,
                                index);
                          },
                          separatorBuilder: (context, index) =>
                              const SizedBox(height: 15.0),
                          itemCount:
                              HomeCubit.getContext(context).fields.length,
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

  Widget buildFieldsItems(
          CategoryModel categoryModel, FieldModel fieldModel, context, index) =>
      InkWell(
        onTap: () {
          // HomeCubit.getContext(context).getQuestionsItems(
          //     categoryName: categoryModel.categoryName!,
          //     fieldName: fieldModel.fieldName!);
          HomeCubit.getContext(context).getSectionsItems(
              categoryName: categoryModel.categoryName!,
              fieldName: fieldModel.fieldName!);
          navigateTo(
              context,
              SectionsScreen(
                fieldModel: fieldModel,
              ));
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: Container(
            alignment: AlignmentDirectional.center,
            width: double.infinity,
            height: 50.0,
            decoration: BoxDecoration(
                color: const Color(0xffD5C3AD),
                borderRadius: BorderRadiusDirectional.circular(16.0)),
            child:
                Text('${HomeCubit.getContext(context).fields[index].fieldName}',
                    style: TextStyle(
                      color: mainColor,
                      fontSize: 18.0,
                      fontWeight: FontWeight.w600,
                    )),
          ),
        ),
      );

  showDialogFunc(context, title, desc) {
    return showDialog(
      context: context,
      builder: (context) => Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 30.0),
          child: Material(
            type: MaterialType.transparency,
            child: Container(
              width: 100.0,
              height: 50.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadiusDirectional.circular(15.0),
                color: Colors.white,
              ),
              child: Column(
                children: [
                  Text(
                    '$title',
                    style: TextStyle(fontSize: 18.0, color: secondColor),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
