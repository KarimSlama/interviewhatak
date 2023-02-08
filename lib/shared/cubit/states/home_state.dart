abstract class HomeState {}

class HomeInitialState extends HomeState {}

class HomeNavigationBarChangedState extends HomeState {}

class CategoryLoadingState extends HomeState {}

class CategoryDataSuccessState extends HomeState {}

class CategoryDataErrorState extends HomeState {
  final String error;

  CategoryDataErrorState(this.error);
}

class GetCategoryLoadingState extends HomeState {}

class GetCategoryDataSuccessState extends HomeState {
}

class GetCategoryDataErrorState extends HomeState {
  final String error;

  GetCategoryDataErrorState(this.error);
}

class GetAllCategoryDataSuccessState extends HomeState {}

class GetAllCategoryDataErrorState extends HomeState {
  final String error;

  GetAllCategoryDataErrorState(this.error);
}

class CreateFieldLoadingState extends HomeState {}

class CreateFieldDataSuccessState extends HomeState {}

class CreateFieldDataErrorState extends HomeState {
  final String error;

  CreateFieldDataErrorState(this.error);
}

class GetFieldLoadingState extends HomeState {}

class GetFieldDataSuccessState extends HomeState {}

class GetFieldDataErrorState extends HomeState {
  final String error;

  GetFieldDataErrorState(this.error);
}

class LogoutSuccessState extends HomeState {}

class LogoutErrorState extends HomeState {
  final String error;

  LogoutErrorState(this.error);
}

// class ListViewShownState extends HomeState {}

class GetUserLoadingState extends HomeState {}

class GetUserDataSuccessState extends HomeState {}

class GetUserDataErrorState extends HomeState {
  final String error;

  GetUserDataErrorState(this.error);
}

class UpdateNewUserDataErrorState extends HomeState {
  final String error;

  UpdateNewUserDataErrorState(this.error);
}

class GetProfileImageSuccessState extends HomeState {}

class GetProfileImageErrorState extends HomeState {}

class GetCategoryImageSuccessState extends HomeState {}

class GetCategoryImageErrorState extends HomeState {}

class UploadImageLoading extends HomeState {}

class UploadImageSuccessState extends HomeState {}

class UploadImageErrorState extends HomeState {}

class ChangeProfileImageErrorState extends HomeState {}

class ContactMessageSuccessState extends HomeState {}

class ContactMessageErrorState extends HomeState {
  final String error;

  ContactMessageErrorState(this.error);
}
