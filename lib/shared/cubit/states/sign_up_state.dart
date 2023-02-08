abstract class SignUpStates {}

class SignUpInitialState extends SignUpStates {}

class SignUpLoadingState extends SignUpStates {}

class SignUpSuccessState extends SignUpStates {}

class SignUpErrorState extends SignUpStates {}

class SignUpCreateUserSuccessState extends SignUpStates {
  final String uId;

  SignUpCreateUserSuccessState(this.uId);
}

class SignUpCreateUserErrorState extends SignUpStates {
  final String error;

  SignUpCreateUserErrorState(this.error);
}

class SignUpChangePasswordVisibilityState extends SignUpStates {}
