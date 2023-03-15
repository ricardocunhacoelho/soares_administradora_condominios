class HouseServiceProvider {
  final String id;
  final EProvided provided;
  HouseServiceProvider({
    required this.id,
    required this.provided,
  });
}

enum EProvided { masonry, woodwork, network, cleaning, security }
