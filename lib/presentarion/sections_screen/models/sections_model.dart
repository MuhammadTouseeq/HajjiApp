class Bed {
  final int id;
  final String name;
   String? mapURL="";
  bool? isReserved=false;
  bool? isMyBed=false;
  final bool? hasAC;

  Bed({
    required this.id,
    required this.name,
    this.isReserved,
    this.hasAC,
    this.isMyBed,
    this.mapURL
  });
}

class BedData {
  String? sectionNumber;
  String? bedNumber;
  String? type;
  String? reservation_map;
  bool? isReserved;
  bool? isMyBed;

  BedData({this.sectionNumber, this.bedNumber, this.type, this.isReserved});

  BedData.fromJson(Map<String, dynamic> json) {
    sectionNumber = json['section_number'];
    bedNumber = json['bed_number'];
    type = json['type'];
    isReserved = json['is_reserved'];
    isMyBed = json['is_my_bed'];
    reservation_map = json['reservation_map'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['section_number'] = this.sectionNumber;
    data['bed_number'] = this.bedNumber;
    data['type'] = this.type;
    data['is_reserved'] = this.isReserved;
    data['is_my_bed'] = this.isMyBed;
    data['reservation_map'] = this.reservation_map;
    return data;
  }
}
class DataItem {
  String sectionNumber;
  String type;

  DataItem({
    required this.sectionNumber,
    required this.type,
  });


  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['section_number'] = this.sectionNumber;
    data['type'] = this.type;
    return data;
  }
  factory DataItem.fromJson(Map<String, dynamic> json) {
    return DataItem(
      sectionNumber: json['section_number'],
      type: json['type'],
    );
  }
}