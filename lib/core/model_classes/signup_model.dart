class SignUpModel {
  int? id;
  String? name;
  String? email;
  int? otp;
  String? apiToken;
  String? emailVerifiedAt;

  SignUpModel(
      {this.id,
        this.name,
        this.email,
        this.otp,
        this.apiToken,
        this.emailVerifiedAt});

  SignUpModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    otp = json['otp'];
    apiToken = json['api_token'];
    emailVerifiedAt = json['email_verified_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['email'] = this.email;
    data['otp'] = this.otp;
    data['api_token'] = this.apiToken;
    data['email_verified_at'] = this.emailVerifiedAt;
    return data;
  }
}
