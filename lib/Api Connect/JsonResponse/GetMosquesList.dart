class GetMosquesList {
  int? masjidId;
  String? masjidName;
  String? masjidLocation;
  String? masjidAddress;
  String? masjidPincode;
  String? masjidMadhab;
  String? masjidLastUpdatedTime;
  String? masjidImagePath;
  String? masjidImageURL;
  Null? userId;
  String? subscribedFlag;
  List<WaqthDetails>? waqthDetails;

  GetMosquesList(
      {this.masjidId,
      this.masjidName,
      this.masjidLocation,
      this.masjidAddress,
      this.masjidPincode,
      this.masjidMadhab,
      this.masjidLastUpdatedTime,
      this.masjidImagePath,
      this.masjidImageURL,
      this.userId,
      this.subscribedFlag,
      this.waqthDetails});

  GetMosquesList.fromJson(Map<String, dynamic> json) {
    masjidId = json['masjidId'];
    masjidName = json['masjidName'];
    masjidLocation = json['masjidLocation'];
    masjidAddress = json['masjidAddress'];
    masjidPincode = json['masjidPincode'];
    masjidMadhab = json['masjidMadhab'];
    masjidLastUpdatedTime = json['masjidLastUpdatedTime'];
    masjidImagePath = json['masjidImagePath'];
    masjidImageURL = json['masjidImageURL'];
    userId = json['userId'];
    subscribedFlag = json['subscribedFlag'];
    if (json['waqthDetails'] != null) {
      waqthDetails = <WaqthDetails>[];
      json['waqthDetails'].forEach((v) {
        waqthDetails!.add(new WaqthDetails.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['masjidId'] = this.masjidId;
    data['masjidName'] = this.masjidName;
    data['masjidLocation'] = this.masjidLocation;
    data['masjidAddress'] = this.masjidAddress;
    data['masjidPincode'] = this.masjidPincode;
    data['masjidMadhab'] = this.masjidMadhab;
    data['masjidLastUpdatedTime'] = this.masjidLastUpdatedTime;
    data['masjidImagePath'] = this.masjidImagePath;
    data['masjidImageURL'] = this.masjidImageURL;
    data['userId'] = this.userId;
    data['subscribedFlag'] = this.subscribedFlag;
    if (this.waqthDetails != null) {
      data['waqthDetails'] = this.waqthDetails!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class WaqthDetails {
  int? masjidId;
  int? masjidWaqthId;
  int? waqthId;
  String? waqthName;
  String? azanTime;
  String? iqaamathTime;
  String? startTime;
  String? endTime;

  WaqthDetails(
      {this.masjidId,
      this.masjidWaqthId,
      this.waqthId,
      this.waqthName,
      this.azanTime,
      this.iqaamathTime,
      this.startTime,
      this.endTime});

  WaqthDetails.fromJson(Map<String, dynamic> json) {
    masjidId = json['masjidId'];
    masjidWaqthId = json['masjidWaqthId'];
    waqthId = json['waqthId'];
    waqthName = json['waqthName'];
    azanTime = json['azanTime'];
    iqaamathTime = json['iqaamathTime'];
    startTime = json['startTime'];
    endTime = json['endTime'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['masjidId'] = this.masjidId;
    data['masjidWaqthId'] = this.masjidWaqthId;
    data['waqthId'] = this.waqthId;
    data['waqthName'] = this.waqthName;
    data['azanTime'] = this.azanTime;
    data['iqaamathTime'] = this.iqaamathTime;
    data['startTime'] = this.startTime;
    data['endTime'] = this.endTime;
    return data;
  }
}
