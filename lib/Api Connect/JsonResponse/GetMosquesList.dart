class GetMosquesList {
  int? deviceId;
  String? deviceName;
  int? masjidDeviceId;
  int? masjidId;
  String? masjidName;
  String? masjidLocation;
  String? masjidAddress;
  String? masjidPincode;
  String? masjidMadhab;
  String? masjidLastUpdatedTime;
  String? masjidImagePath;
  String? masjidImageURL;
  int? userId;
  String? subscribedFlag;
  List<WaqthDetails>? waqthDetails;

  GetMosquesList(
      {this.deviceId,
      this.deviceName,
      this.masjidDeviceId,
      this.masjidId,
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
    deviceId = json['deviceId'];
    deviceName = json['deviceName'];
    masjidDeviceId = json['masjidDeviceId'];
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
    data['deviceId'] = this.deviceId;
    data['deviceName'] = this.deviceName;
    data['masjidDeviceId'] = this.masjidDeviceId;
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
  AzanTime? azanTime;
  AzanTime? iqaamathTime;
  AzanTime? startTime;
  AzanTime? endTime;

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
    azanTime = json['azanTime'] != null
        ? new AzanTime.fromJson(json['azanTime'])
        : null;
    iqaamathTime = json['iqaamathTime'] != null
        ? new AzanTime.fromJson(json['iqaamathTime'])
        : null;
    startTime = json['startTime'] != null
        ? new AzanTime.fromJson(json['startTime'])
        : null;
    endTime =
        json['endTime'] != null ? new AzanTime.fromJson(json['endTime']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['masjidId'] = this.masjidId;
    data['masjidWaqthId'] = this.masjidWaqthId;
    data['waqthId'] = this.waqthId;
    data['waqthName'] = this.waqthName;
    if (this.azanTime != null) {
      data['azanTime'] = this.azanTime!.toJson();
    }
    if (this.iqaamathTime != null) {
      data['iqaamathTime'] = this.iqaamathTime!.toJson();
    }
    if (this.startTime != null) {
      data['startTime'] = this.startTime!.toJson();
    }
    if (this.endTime != null) {
      data['endTime'] = this.endTime!.toJson();
    }
    return data;
  }
}

class AzanTime {
  int? ticks;
  int? days;
  int? hours;
  int? milliseconds;
  int? minutes;
  int? seconds;
  int? totalDays;
  int? totalHours;
  int? totalMilliseconds;
  int? totalMinutes;
  int? totalSeconds;

  AzanTime(
      {this.ticks,
      this.days,
      this.hours,
      this.milliseconds,
      this.minutes,
      this.seconds,
      this.totalDays,
      this.totalHours,
      this.totalMilliseconds,
      this.totalMinutes,
      this.totalSeconds});

  AzanTime.fromJson(Map<String, dynamic> json) {
    ticks = json['ticks'];
    days = json['days'];
    hours = json['hours'];
    milliseconds = json['milliseconds'];
    minutes = json['minutes'];
    seconds = json['seconds'];
    totalDays = json['totalDays'];
    totalHours = json['totalHours'];
    totalMilliseconds = json['totalMilliseconds'];
    totalMinutes = json['totalMinutes'];
    totalSeconds = json['totalSeconds'];
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ticks'] = this.ticks;
    data['days'] = this.days;
    data['hours'] = this.hours;
    data['milliseconds'] = this.milliseconds;
    data['minutes'] = this.minutes;
    data['seconds'] = this.seconds;
    data['totalDays'] = this.totalDays;
    data['totalHours'] = this.totalHours;
    data['totalMilliseconds'] = this.totalMilliseconds;
    data['totalMinutes'] = this.totalMinutes;
    data['totalSeconds'] = this.totalSeconds;
    return data;
  }
}
