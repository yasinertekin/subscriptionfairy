/// App configuration interface
abstract class AppConfiguration {
  /// The api key
  String get apiKey;

  /// The app id
  String get appId;

  /// The measurement id
  String get messagingSenderId;

  /// The project id
  String get projectId;

  /// The storage bucket
  String get storageBucket;

  /// The ios bundle id
  String get iosBundleId;

  /// The measurement id
  String get authDomain;

  /// The measurement id
  String get measurementId;
}
