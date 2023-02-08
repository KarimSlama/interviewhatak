abstract class LoginStates {}

class LoginInitialState extends LoginStates {}

class LoginLoadingState extends LoginStates {}

class LoginSuccessState extends LoginStates {
  final String uId;

  LoginSuccessState(this.uId);
}

class LoginErrorState extends LoginStates {
  final String error;

  LoginErrorState(this.error);
}

class LoginAdminLoadingState extends LoginStates {}

class LoginAdminSuccessState extends LoginStates {
  final String uId;

  LoginAdminSuccessState(this.uId);
}

class LoginAdminErrorState extends LoginStates {
  final String error;

  LoginAdminErrorState(this.error);
}

class LoginChangePasswordVisibilityState extends LoginStates {}

class ResetPasswordSuccessState extends LoginStates {}

class ResetPasswordErrorState extends LoginStates {}
