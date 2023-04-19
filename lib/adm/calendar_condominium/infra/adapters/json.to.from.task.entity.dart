import 'package:soares_administradora_condominios/adm/calendar_condominium/domain/entity/task.condominium.entity.dart';

class JsonToFromTaskCondominiumEntity {
  static Map<String, dynamic> toMap(TaskCondominiumEntity task) {
    return {
      'id': task.id,
      'title': task.title,
      'details': task.details,
      'startTaskDate': task.startTaskDate.toIso8601String(),
      'endTaskDate':
          task.endTaskDate != null ? task.endTaskDate!.toIso8601String() : null,
    };
  }

  static TaskCondominiumEntity fromMap(dynamic json) {
    return TaskCondominiumEntity(
      id: json['id'],
      title: json['title'],
      details: json['details'],
      startTaskDate: DateTime.parse(json['startTaskDate']),
      endTaskDate: json.containsKey('endTaskDate')
          ? DateTime.parse(json['endTaskDate'])
          : null,
    );
  }
}
