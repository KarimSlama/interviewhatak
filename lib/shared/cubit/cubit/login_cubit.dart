import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:interview/models/user_model.dart';
import 'package:interview/shared/cubit/states/login_state.dart';
import 'package:interview/styles/icon_broken.dart';

class LoginCubit extends Cubit<LoginStates> {
  LoginCubit() : super(LoginInitialState());

  static LoginCubit getContext(context) => BlocProvider.of(context);

  UserModel? userModel;

  void loginUser({required String email, required String password}) {
    emit(LoginLoadingState());
    FirebaseAuth.instance
        .signInWithEmailAndPassword(
      email: email,
      password: password,
    )
        .then((value) {
      print(value.user!.email);
      print(value.user!.uid);
      emit(LoginSuccessState(value.user!.uid));
      print('normal user');
    }).catchError((error) {
      print(error.toString());
      emit(LoginErrorState(error.toString()));
    });
  }

  void loginAdminUser({required String email, required String password}) async {
    emit(LoginAdminLoadingState());
    await FirebaseFirestore.instance
        .collection('admins')
        .doc('admins_account')
        .snapshots()
        .forEach((element) {
      if (element.data()?['email'] == email &&
          element.data()?['password'] == password) {
        print(element.id);
        emit(LoginAdminSuccessState(element.id));
        print('admin user');
      } else {
        loginUser(email: email, password: password);
      }
    }).catchError((error) {
      emit(LoginAdminErrorState(error.toString()));
    });
  }

  void resetPassword({required String email}) {
    FirebaseAuth.instance.sendPasswordResetEmail(email: email).then((value) {
      emit(ResetPasswordSuccessState());
    }).catchError((error) {
      emit(ResetPasswordErrorState());
    });
  }

  bool isPassword = true;
  IconData suffixIcon = IconBroken.Show;

  void changePasswordVisibility() {
    isPassword = !isPassword;
    suffixIcon = isPassword ? IconBroken.Show : IconBroken.Hide;
    emit(LoginChangePasswordVisibilityState());
  }
}
