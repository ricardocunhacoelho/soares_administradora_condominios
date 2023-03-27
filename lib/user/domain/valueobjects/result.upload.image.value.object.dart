import 'package:firebase_storage/firebase_storage.dart';

class ResultUploadImageValueObject {
  final String? msgError;
  final UploadTask? task;
  ResultUploadImageValueObject({
    required this.msgError,
    required this.task,
  });
  bool get isSuccess => msgError == null;
}
