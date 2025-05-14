class SurveySplashModel {
  Future<void> synchronizeMasterData({
    required Function(String message) onMessageUpdate,
  }) async {
    onMessageUpdate("Loading master data...");
    await Future.delayed(Duration(seconds: 1));

    onMessageUpdate("Loading locations...");
    await Future.delayed(Duration(seconds: 1));

    onMessageUpdate("Finalizing...");
    await Future.delayed(Duration(seconds: 1));

    onMessageUpdate("Done!");
  }
}
