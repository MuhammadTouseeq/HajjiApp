class Bed {
  final String id;
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
class DataItem {
  String sectionNumber;
  String type;

  DataItem({
    required this.sectionNumber,
    required this.type,
  });

  factory DataItem.fromJson(Map<String, dynamic> json) {
    return DataItem(
      sectionNumber: json['section_number'],
      type: json['type'],
    );
  }
}