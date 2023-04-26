class PollingEntity {
  final String id;
  final String title;
  final String text;
  final DateTime dateStart;
  final DateTime dateFinish;
  final int votesYes;
  final int votesNo;
  final String? image;

  PollingEntity({
    required this.id,
    required this.title,
    required this.text,
    required this.dateStart,
    required this.dateFinish,
    required this.votesYes,
    required this.votesNo,
    this.image,
  });
}