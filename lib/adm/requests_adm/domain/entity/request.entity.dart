
class RequestsAdmEntity {
  final String id;
  final DateTime date;
  final bool completed;
  final ERequestType requestType;
  RequestsAdmEntity({
    required this.id,
    required this.date,
    required this.completed,
    required this.requestType,
  });
}

enum ERequestType { access, delete}
