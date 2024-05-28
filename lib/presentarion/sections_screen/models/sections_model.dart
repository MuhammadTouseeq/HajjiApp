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
