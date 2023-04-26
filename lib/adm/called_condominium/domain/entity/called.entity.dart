
class CalledEntity {
  final String id;
  final String about;
  final String message;
  final String residentId;
  final String unitId;
  final ESectorDestiny sectorDestiny;
  final DateTime dateSend;
  final DateTime dateSeen;
  final bool seen;

  CalledEntity({
    required this.id,
    required this.about,
    required this.message,
    required this.residentId,
    required this.unitId,
    required this.sectorDestiny,
    required this.dateSend,
    required this.dateSeen,
    required this.seen,
  });
}

enum ESectorDestiny { sindico, porteiro }
