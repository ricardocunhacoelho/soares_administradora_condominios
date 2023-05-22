import 'package:soares_administradora_condominios/adm/areas_condominium/domain/entity/area.condominium.entity.dart';

class JsonToFromAreaCondominiumEntity {
  static Map<String, dynamic> toMap(AreaCondominiumEntity areaCondominium) {
    return {
      'id': areaCondominium.id,
      'title': areaCondominium.title,
      'rules': areaCondominium.rules,
      'description': areaCondominium.description,
      'numberOfPeople': areaCondominium.numberOfPeople,
      'price': areaCondominium.price,
      'reserveDateList': areaCondominium.reserveDateList
          .map((e) => e.toIso8601String())
          .toList(),
      'carouselImage': areaCondominium.carouselImage,
    };
  }

  static AreaCondominiumEntity fromMap(dynamic json) {
    return AreaCondominiumEntity(
      id: json['id'],
      title: json['title'],
      rules: json['rules'],
      description: json['description'],
      numberOfPeople: json['numberOfPeople'] ?? 0,
      price: json['price'].toDouble() ?? 0,
      reserveDateList: json.containsKey('reserveDateList')
          ? (json['reserveDateList'] as List)
              .map((e) => DateTime.parse(e))
              .toList()
          : [],
      carouselImage: json['carouselImage'] as List,
    );
  }
}
