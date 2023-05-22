class AreaCondominiumEntity {
  final String id;
  final String title;
  final List<dynamic> rules;
  final String description;
  final int numberOfPeople;
  final double price;
  final List<dynamic> reserveDateList;
  final List<dynamic> carouselImage;

  AreaCondominiumEntity({
    required this.id,
    required this.title,
    required this.rules,
    required this.description,
    required this.numberOfPeople,
    required this.price,
    required this.reserveDateList,
    required this.carouselImage,
  });
}