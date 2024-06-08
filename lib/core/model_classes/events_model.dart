class EventtsModel {
  List<Events>? events;

  EventtsModel({this.events});

  EventtsModel.fromJson(Map<String, dynamic> json) {
    if (json['events'] != null) {
      events = <Events>[];
      json['events'].forEach((v) {
        events!.add(new Events.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.events != null) {
      data['events'] = this.events!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Events {
  String? eventId;
  String? eventName;
  String? eventStartDate;
  String? eventStartTime;
  String? eventImage;
  String? totalHaaji;
  String? haajiAttendanceMarked;
  String? haajiAttendanceRemaining;

  Events(
      {this.eventId,
        this.eventName,
        this.eventStartDate,
        this.eventStartTime,
        this.eventImage,
        this.totalHaaji,
        this.haajiAttendanceMarked,
        this.haajiAttendanceRemaining});

  Events.fromJson(Map<String, dynamic> json) {
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
