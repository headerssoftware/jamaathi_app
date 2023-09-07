class LoginResponse {
  int? userId;
  String? userName;
  String? userFcmId;
  String? userLastLogin;
  int? osTypeId;
  String? osVersion;

  LoginResponse(
      {this.userId,
      this.userName,
      this.userFcmId,
      this.userLastLogin,
      this.osTypeId,
      this.osVersion});

  LoginResponse.fromJson(Map<String, dynamic> json) {
    userId = json['userId'];
    userName = json['userName'];
    userFcmId = json['userFcmId'];
    userLastLogin = json['userLastLogin'];
    osTypeId = json['osTypeId'];
    osVersion = json['osVersion'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['userId'] = this.userId;
    data['userName'] = this.userName;
    data['userFcmId'] = this.userFcmId;
    data['userLastLogin'] = this.userLastLogin;
    data['osTypeId'] = this.osTypeId;
    data['osVersion'] = this.osVersion;
    return data;
  }
}
