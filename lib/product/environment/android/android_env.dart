import 'package:envied/envied.dart';
import 'package:subscriptionfairy/product/environment/app_configuration.dart';

part 'android_env.g.dart';

@Envied(obfuscate: true, path: 'assets/env/.android.env')

/// This is the environment for the android platform.
final class AndroidEnv implements AppConfiguration {
  @EnviedField(varName: 'API_KEY')
  static final String _apiKey = _AndroidEnv._apiKey;

  @EnviedField(varName: 'APP_ID')
  static final String _appId = _AndroidEnv._appId;

  @EnviedField(varName: 'MESSAGING_SENDER_ID')
  static final String _messagingSenderId = _AndroidEnv._messagingSenderId;

  @EnviedField(varName: 'PROJECT_ID')
  static final String _projectId = _AndroidEnv._projectId;

  @EnviedField(varName: 'STORAGE_BUCKET')
  static final String _storageBucket = _AndroidEnv._storageBucket;

  @override
  String get apiKey => _apiKey;

  @override
  String get messagingSenderId => _messagingSenderId;

  @override
  String get projectId => _projectId;

  @override
  String get storageBucket => _storageBucket;

  @override
  String get appId => _appId;

  @override
  String get authDomain => '';

  @override
  String get iosBundleId => '';

  @override
  String get measurementId => '';
}
