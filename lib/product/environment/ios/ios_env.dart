import 'package:envied/envied.dart';
import 'package:subscriptionfairy/product/environment/app_configuration.dart';

part 'ios_env.g.dart';

@Envied(path: 'assets/env/.ios.env', obfuscate: true)

/// Ios environment class
final class IosEnv implements AppConfiguration {
  @EnviedField(varName: 'API_KEY')
  static final String _apiKey = _IosEnv._apiKey;

  @EnviedField(varName: 'APP_ID')
  static final String _appId = _IosEnv._appId;

  @EnviedField(varName: 'MESSAGING_SENDER_ID')
  static final String _messagingSenderId = _IosEnv._messagingSenderId;

  @EnviedField(varName: 'PROJECT_ID')
  static final String _projectId = _IosEnv._projectId;

  @EnviedField(varName: 'STORAGE_BUCKET')
  static final String _storageBucket = _IosEnv._storageBucket;

  @EnviedField(varName: 'IOS_BUNDLE_ID')
  static final String _iosBundleId = _IosEnv._iosBundleId;

  @override
  String get apiKey => _apiKey;

  @override
  String get appId => _appId;

  @override
  String get authDomain => '';

  @override
  String get iosBundleId => _iosBundleId;

  @override
  String get measurementId => '';

  @override
  String get messagingSenderId => _messagingSenderId;

  @override
  String get projectId => _projectId;

  @override
  String get storageBucket => _storageBucket;
}
