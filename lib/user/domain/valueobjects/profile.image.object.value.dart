
import 'package:firebase_storage/firebase_storage.dart';

class ProfileImageValueObject {
  final String getDownloadURL;
  final String refImage;
  ProfileImageValueObject({
    required this.getDownloadURL,
    required this.refImage,
  });
}
