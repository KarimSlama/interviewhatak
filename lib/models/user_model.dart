class UserModel {
  String? userName;
  String? email;
  String? password;
  String? phone;
  String? uId;
  String? image;

  UserModel({
    this.userName,
    this.email,
    this.password,
    this.phone,
    this.uId,
    this.image,
  });

  UserModel.fromJson(Map<String, dynamic> json) {
    userName = json['userName'];
    email = json['email'];
    password = json['password'];
    phone = json['phone'];
    uId = json['uId'];
    image = json['image'];
  } //end fromJson()

  Map<String, dynamic> toMap() {
    return {
      'userName': userName,
      'email': email,
      'password': password,
      'phone': phone,
      'uId': uId,
      'image': image,
    };
  } //end toMap()
} //end class
