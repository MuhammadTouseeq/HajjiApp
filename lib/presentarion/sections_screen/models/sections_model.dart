class Bed {
  final int id;
  final String name;
  bool? isReserved=false;
  final bool? hasAC;

  Bed({
    required this.id,
    required this.name,
    this.isReserved,
    this.hasAC,
  });
}

class BedData {
  String? sectionNumber;
  String? bedNumber;
  String? type;
  bool? isReserved;

  BedData({this.sectionNumber, this.bedNumber, this.type, this.isReserved});

  BedData.fromJson(Map<String, dynamic> json) {
    sectionNumber = json['section_number'];
    bedNumber = json['bed_number'];
    type = json['type'];
    isReserved = json['is_reserved'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['section_number'] = this.sectionNumber;
    data['bed_number'] = this.bedNumber;
    data['type'] = this.type;
    data['is_reserved'] = this.isReserved;
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