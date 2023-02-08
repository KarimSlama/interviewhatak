class ContactModel {
  String? userName;
  String? userEmail;
  String? userMessage;
  String? userUid;
  String? messageTime;

  ContactModel(
      {this.userName,
      this.userEmail,
      this.userMessage,
      this.userUid,
      this.messageTime});

  ContactModel.fromJson(Map<String, dynamic> json) {
    userName = json['usrName'];
    userEmail = json['usrEmail'];
    userMessage = json['usrMessage'];
    userUid = json['userUid'];
    messageTime = json['messageTime'];
  }

  Map<String, dynamic> toMap() {
    return {
      'userName': userName,
      'userEmail': userEmail,
      'userMessage': userMessage,
      'userUid': userUid,
      'messageTime': messageTime,
    };
  }
}
