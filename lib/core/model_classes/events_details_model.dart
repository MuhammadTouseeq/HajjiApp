class EventsDetailsModel {
  EventDetails? eventDetails;

  EventsDetailsModel({this.eventDetails});

  EventsDetailsModel.fromJson(Map<String, dynamic> json) {
    eventDetails = json['event_details'] != null
        ? new EventDetails.fromJson(json['event_details'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.eventDetails != null) {
      data['event_details'] = this.eventDetails!.toJson();
    }
    return data;
  }
}

class EventDetails {
  String? eventId;
  String? eventName;
  String? eventStartDate;
  String? eventStartTime;
  String? eventImage;
  String? totalHaaji;
  String? haajiAttendanceMarked;
  String? haajiAttendanceRemaining;

  EventDetails(
      {this.eventId,
        this.eventName,
        this.eventStartDate,
        this.eventStartTime,
        this.eventImage,
        this.totalHaaji,
        this.haajiAttendanceMarked,
        this.haajiAttendanceRemaining});

  EventDetails.fromJson(Map<String, dynamic> json) {
    eventId = json['event_id'];
    eventName = json['event_name'];
    eventStartDate = json['event_start_date'];
    eventStartTime = json['event_start_time'];
    eventImage = json['event_image'];
    totalHaaji = json['total_haaji'];
    haajiAttendanceMarked = json['haaji_attendance_marked'];
    haajiAttendanceRemaining = json['haaji_attendance_remaining'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['event_id'] = this.eventId;
    data['event_name'] = this.eventName;
    data['event_start_date'] = this.eventStartDate;
    data['event_start_time'] = this.eventStartTime;
    data['event_image'] = this.eventImage;
    data['total_haaji'] = this.totalHaaji;
    data['haaji_attendance_marked'] = this.haajiAttendanceMarked;
    data['haaji_attendance_remaining'] = this.haajiAttendanceRemaining;
    return data;
  }
}
