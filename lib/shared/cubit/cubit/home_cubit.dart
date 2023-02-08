import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:interview/models/category_model.dart';
import 'package:interview/models/contact_model.dart';
import 'package:interview/models/field_model.dart';
import 'package:interview/models/user_model.dart';
import 'package:interview/modules/category_screen/category_screen.dart';
import 'package:interview/modules/favorite_screen/favorite_screen.dart';
import 'package:interview/modules/home_screen/home_screen.dart';
import 'package:interview/modules/profile_screen/profile_screen.dart';
import 'package:interview/shared/components/constants.dart';
import 'package:interview/shared/cubit/states/home_state.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitialState());

  static HomeCubit getContext(context) => BlocProvider.of(context);

  int currentIndex = 0;

  List<Widget> screens = [
    const HomeScreen(),
    const FavoriteScreen(),
    const CategoryScreen(),
    const ProfileScreen(),
  ];

  List<String> titles = [
    'Home',
    'Favorite',
    'Category',
    'Profile',
  ];

  void changeBottomNavigation(int index) {
    currentIndex = index;
    emit(HomeNavigationBarChangedState());
  }

  UserModel? userModel;

  void getUserData() {
    FirebaseFirestore.instance.collection('users').doc(uId).get().then((value) {
      userModel = UserModel.fromJson(value.data()!);
      emit(GetUserDataSuccessState());
    }).catchError((error) {
      print('Error is $error');
      emit(GetUserDataErrorState(error.toString()));
    });
  }

  void updateUserData({
    required String userName,
    required String email,
    required String phone,
    String? image,
  }) {
    userModel = UserModel(
      image: image ?? userModel!.image,
      uId: userModel!.uId,
      email: email,
      password: userModel!.password,
      userName: userName,
      phone: phone,
    );
    FirebaseFirestore.instance
        .collection('users')
        .doc(userModel!.uId)
        .update(userModel!.toMap())
        .then((value) {
      getUserData();
    }).catchError((error) {
      print(error.toString());
      emit(UpdateNewUserDataErrorState(error.toString()));
    });
  }

  File? profileImage;
  var picker = ImagePicker();

  Future<void> pickProfileImage() async {
    final pickedImage = await picker.pickImage(source: ImageSource.gallery);
    if (pickedImage != null) {
      profileImage = File(pickedImage.path);
      emit(GetProfileImageSuccessState());
    } else {
      print('no image selected');
      emit(GetProfileImageErrorState());
    }
  } //end pickProfileImage()

  void changeProfileImage() {
    firebase_storage.FirebaseStorage.instance
        .ref()
        .child('users_image/${Uri.file(profileImage!.path).pathSegments.last}')
        .putFile(profileImage!)
        .then((value) {
      value.ref.getDownloadURL().then((value) {
        updateUserData(
          userName: userModel!.userName!,
          email: userModel!.email!,
          phone: userModel!.phone!,
          image: value,
        );
      }).catchError((error) {
        emit(ChangeProfileImageErrorState());
        print(error.toString());
      });
    }).catchError((error) {
      emit(ChangeProfileImageErrorState());
      print(error.toString());
    });
  }

  File? categoryImage;
  Uint8List webImage = Uint8List(8);

  Future<void> pickCategoryImage() async {
    final pickedImage = await picker.pickImage(source: ImageSource.gallery);
    if (pickedImage != null) {
      categoryImage = File(pickedImage.path);
      emit(GetCategoryImageSuccessState());
    } else {
      print('no image selected');
      emit(GetCategoryImageErrorState());
    }
  } //end pickImage()

  CategoryModel? categoryModel;
  List<CategoryModel> categories = [];

  void createCategoriesItems({
    required String categoryName,
    required String categoryImage,
    required String categoryDateTime,
  }) {
    categoryModel = CategoryModel(
      categoryName: categoryName,
      categoryImage: categoryImage,
      dateTime: categoryDateTime,
    );
    emit(CategoryLoadingState());
    FirebaseFirestore.instance
        .collection('categories')
        .add(categoryModel!.toMap())
        .then((value) {
      emit(CategoryDataSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(CategoryDataErrorState(error.toString()));
    });
  }

  void uploadCategory({
    required String categoryName,
    required String categoryDateTime,
  }) {
    emit(UploadImageLoading());
    firebase_storage.FirebaseStorage.instance
        .ref()
        .child('categories/${Uri.file(categoryImage!.path).pathSegments.last}')
        .putFile(categoryImage!)
        .then((value) {
      value.ref.getDownloadURL().then((value) {
        createCategoriesItems(
          categoryName: categoryName,
          categoryImage: value,
          categoryDateTime: categoryDateTime,
        );
      }).catchError((error) {
        print(error.toString());
        emit(UploadImageSuccessState());
      });
    }).catchError((error) {
      print(error.toString());
      emit(UploadImageSuccessState());
    });
  } //end uploadImage()

  void getCategoriesItems() {
    emit(GetCategoryLoadingState());

    FirebaseFirestore.instance
        .collection('categories')
        .snapshots()
        .listen((event) {
      categories = [];
      event.docs.forEach((element) {
        categories.add(CategoryModel.fromJson(element.data()));
        categoryModel = CategoryModel(
          categoryName: element.get('categoryName'),
          categoryImage: element.get('categoryImage'),
        );
        emit(GetCategoryDataSuccessState());
      });
    });
  } //end getCategoriesItems()

  List<String> categoriesId = [];

  void getAllCategories() {
    FirebaseFirestore.instance.collection('categories').get().then((value) {
      value.docs.forEach((element) {
        categoriesId.add(element.id);
        print(element.id);
      });
      emit(GetAllCategoryDataSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(GetAllCategoryDataErrorState(error.toString()));
    });
  }

  FieldModel? fieldModel;

  void createFieldItems({
    required String fieldName,
    required String fieldDescription,
    required String fieldTime,
    required String categoryName,
  }) {
    fieldModel = FieldModel(
      fieldName: fieldName,
      fieldDescription: fieldDescription,
      fieldDate: fieldTime,
      categoryName: categoryName,
    );
    emit(CreateFieldLoadingState());
    FirebaseFirestore.instance
        .collection('categories')
        .doc(categoryName)
        .collection('fields')
        .doc(fieldName)
        .set(fieldModel!.toMap())
        .then((value) {
      emit(CreateFieldDataSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(CreateFieldDataErrorState(error.toString()));
    });
  }

  List<FieldModel> fields = [];

  void getCategoriesFieldItems({required String categoryFieldName}) {
    emit(GetFieldLoadingState());

    FirebaseFirestore.instance
        .collection('categories')
        .doc(categoryFieldName)
        .collection('fields')
        .snapshots()
        .listen((event) {
      print('the all value are ${event.docs.length}');
      fields = [];
      event.docs.forEach((element) {
        fields.add(FieldModel.fromJson(element.data()));
        fieldModel = FieldModel(
          fieldName: element.get('fieldName'),
          fieldDescription: element.get('fieldDescription'),
          categoryName: element.get('categoryName'),
        );
        emit(GetFieldDataSuccessState());
      });
    });
  } //end getCategoriesItems()

  ContactModel? contactModel;

  void contactMessages(
      {required String userName,
      required String email,
      required String message,
      required String messageTime}) {
    contactModel = ContactModel(
      userName: userName,
      userEmail: email,
      userUid: userModel!.uId,
      messageTime: messageTime,
      userMessage: message,
    );
    FirebaseFirestore.instance
        .collection('messages')
        .doc(uId)
        .set(contactModel!.toMap())
        .then((value) {
      emit(ContactMessageSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(ContactMessageErrorState(error.toString()));
    });
  }
} //end class
