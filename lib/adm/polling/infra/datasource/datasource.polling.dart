abstract class IPollingDataSource {
  Stream<List<dynamic>> getAllPolling();

  Future<void> answerPolling(
      String uid,
      List<Map<String,dynamic>> listMapPollings,
      Map<String, dynamic> responsePolling,
      Map pollingMap);
}
