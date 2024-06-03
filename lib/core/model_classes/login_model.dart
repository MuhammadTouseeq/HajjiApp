class LoginModel {
  String? userId;
  String? haajiId;
  String? emailId;
  String? phoneNumber;
  String? reservationNumber;
  String? haajiName;
  String? birthDate;
  String? birthDateHijri;
  String? gender;
  String? nationality;
  String? camp;
  String? packageNumber;
  String? sim;
  String? city;
  String? transport;
  String? bookingDate;
  String? hajjStatus;
  String? status;
  String? deleted;
  String? verified;
  String? sessionCode;
  String? token;

  LoginModel(
      {this.userId,
        this.haajiId,
        this.emailId,
        this.phoneNumber,
        this.reservationNumber,
        this.haajiName,
        this.birthDate,
        this.birthDateHijri,
        this.gender,
        this.nationality,
        this.camp,
        this.packageNumber,
        this.sim,
        this.city,
        this.transport,
        this.bookingDate,
        this.hajjStatus,
        this.status,
        this.deleted,
        this.verified,
        this.sessionCode,
        this.token
      });

  LoginModel.fromJson(Map<String, dynamic> json) {
    userId = json['user_id'];
    haajiId = json['haaji_id'];
    emailId = json['email_id'];
    phoneNumber = json['phone_number'];
    reservationNumber = json['reservation_number'];
    haajiName = json['haaji_name'];
    birthDate = json['birth_date'];
    birthDateHijri = json['birth_date_hijri'];
    gender = json['gender'];
    nationality = json['nationality'];
    camp = json['camp'];
    packageNumber = json['package_number'];
    sim = json['sim'];
    city = json['city'];
    transport = json['transport'];
    bookingDate = json['booking_date'];
    hajjStatus = json['hajj_status'];
    status = json['status'];
    deleted = json['deleted'];
    verified = json['verified'];
    sessionCode = json['session_code'];
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['user_id'] = this.userId;
    data['haaji_id'] = this.haajiId;
    data['email_id'] = this.emailId;
    data['phone_number'] = this.phoneNumber;
    data['reservation_number'] = this.reservationNumber;
    data['haaji_name'] = this.haajiName;
    data['birth_date'] = this.birthDate;
    data['birth_date_hijri'] = this.birthDateHijri;
    data['gender'] = this.gender;
    data['nationality'] = this.nationality;
    data['camp'] = this.camp;
    data['package_number'] = this.packageNumber;
    data['sim'] = this.sim;
    data['city'] = this.city;
    data['transport'] = this.transport;
    data['booking_date'] = this.bookingDate;
    data['hajj_status'] = this.hajjStatus;
    data['status'] = this.status;
    data['deleted'] = this.deleted;
    data['verified'] = this.verified;
    data['session_code'] = this.sessionCode;
    data['token'] = this.token;
    return data;
  }
}
