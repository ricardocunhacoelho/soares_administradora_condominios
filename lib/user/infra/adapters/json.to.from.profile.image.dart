
import 'package:soares_administradora_condominios/user/domain/valueobjects/profile.image.object.value.dart';

class JsonToFromProfileImageValueObject {
  static Map<String, dynamic> toMap(
      ProfileImageValueObject profileImageValueObject) {
    return {
      'getDownloadURL': profileImageValueObject.getDownloadURL,
      'refImage': profileImageValueObject.refImage,
    };
  }

  static ProfileImageValueObject fromMap(dynamic json) {
    return ProfileImageValueObject(
      getDownloadURL: json['getDownloadURL'],
      refImage: json['refImage'],
    );
  }
}
