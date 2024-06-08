class ManagerLoginModel {
  String? userId;
  String? sessionCode;
  String? fullName;

  ManagerLoginModel({this.userId, this.sessionCode, this.fullName});

  ManagerLoginModel.fromJson(Map<String, dynamic> json) {
    userId = json['user_id'];
    sessionCode = json['session_code'];
    fullName = json['full_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['user_id'] = this.userId;
    data['session_code'] = this.sessionCode;
    data['full_name'] = this.fullName;
    return data;
  }
}
