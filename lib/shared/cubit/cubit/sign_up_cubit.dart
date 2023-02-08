import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:interview/models/user_model.dart';
import 'package:interview/shared/cubit/states/sign_up_state.dart';
import 'package:interview/styles/icon_broken.dart';

class SignUpCubit extends Cubit<SignUpStates> {
  SignUpCubit() : super(SignUpInitialState());

  static SignUpCubit getContext(context) => BlocProvider.of(context);

  UserModel? userModel;

  void createNewUser({
    required String userName,
    required String email,
    required String password,
    required String phone,
  }) {
    FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email, password: password)
        .then((value) {
      saveNewUser(
        userName: userName,
        email: email,
        password: password,
        phone: phone,
        uId: value.user!.uid,
      );
    }).catchError((error) {
      print(error.toString());
    });
  }

  void saveNewUser(
      {required String userName,
      required String email,
      required String password,
      required String phone,
      required String uId}) {
    userModel = UserModel(
        userName: userName,
        email: email,
        password: password,
        phone: phone,
        uId: uId,
        image:
            'https://imgv3.fotor.com/images/blog-richtext-image/part-blurry-image.jpg');
    FirebaseFirestore.instance
        .collection('users')
        .doc(uId)
        .set(userModel!.toMap())
        .then((value) {
      emit(SignUpCreateUserSuccessState(uId));
    }).catchError((error) {
      print(error.toString());
      emit(SignUpCreateUserErrorState(error.toString()));
    });
  }

  bool isPassword = true;
  IconData suffixIcon = IconBroken.Show;

  void changePasswordVisibility() {
    isPassword = !isPassword;
    suffixIcon = isPassword ? IconBroken.Show : IconBroken.Hide;
    emit(SignUpChangePasswordVisibilityState());
  }
}
