import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:interview/models/category_model.dart';
import 'package:interview/modules/field_details_screen/field_details_screen.dart';
import 'package:interview/shared/components/components.dart';
import 'package:interview/shared/components/constants.dart';
import 'package:interview/shared/cubit/cubit/home_cubit.dart';
import 'package:interview/shared/cubit/states/home_state.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeState>(
      listener: (context, state) {},
      builder: (context, state) {
        return ConditionalBuilder(
          condition: HomeCubit.getContext(context).categories.isNotEmpty,
          builder: (context) => Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              children: [
                const SizedBox(
                  height: 18.0,
                ),
                Expanded(
                  child: GridView.count(
                    physics: const BouncingScrollPhysics(),
                    crossAxisCount: 2,
                    mainAxisSpacing: 1.0,
                    crossAxisSpacing: 1.0,
                    childAspectRatio: 1 / 1.3,
                    children: List.generate(
                      HomeCubit.getContext(context).categories.length,
                      (index) => buildItem(
                          HomeCubit.getContext(context).categories[index],
                          context,
                          index),
                    ),
                  ),
                ),
              ],
            ),
          ),
          fallback: (context) => Center(
              child: SpinKitSpinningLines(
            size: 40.0,
            color: mainColor,
          )),
        );
      },
    );
  }

  Widget buildItem(CategoryModel categoryModel, context, index) => InkWell(
        onTap: () {
          HomeCubit.getContext(context).getCategoriesFieldItems(
              categoryFieldName: categoryModel.categoryName!);
          navigateTo(
              context,
              FieldDetailsScreen(
                categoryModel: categoryModel,
              ));
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
                        '${categoryModel.categoryImage}',
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10.0,
                ),
                Text(
                  '${categoryModel.categoryName}',
                  style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.w500,
                      color: mainColor),
                ),
              ],
            ),
          ],
        ),
      );
}
