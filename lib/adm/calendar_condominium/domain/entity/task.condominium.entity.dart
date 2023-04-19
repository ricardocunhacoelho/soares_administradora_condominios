class TaskCondominiumEntity {
  final String id;
  final String title;
  final String details;
  final DateTime startTaskDate;
  final DateTime? endTaskDate;

  TaskCondominiumEntity({
    required this.id,
    required this.title,
    required this.details,
    required this.startTaskDate,
    this.endTaskDate,
  });
}