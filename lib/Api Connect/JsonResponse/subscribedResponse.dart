class subscribedResponse {
  int? userMasjidId;
  int? userId;
  int? masjidId;

  subscribedResponse({this.userMasjidId, this.userId, this.masjidId});

  subscribedResponse.fromJson(Map<String, dynamic> json) {
    userMasjidId = json['userMasjidId'];
    userId = json['userId'];
    masjidId = json['masjidId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['userMasjidId'] = this.userMasjidId;
    data['userId'] = this.userId;
    data['masjidId'] = this.masjidId;
    return data;
  }
}
