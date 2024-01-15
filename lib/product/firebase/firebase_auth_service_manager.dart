import 'package:firebase_auth/firebase_auth.dart';
import 'package:subscriptionfairy/product/service/firebase_auth_service.dart';

/// [FirebaseAuthServiceManager] is a class that contains all string constants.
final class FirebaseAuthServiceManager {
  FirebaseAuthServiceManager._init();
  static FirebaseAuthServiceManager? _instance;

  /// [instance] is a singleton instance of [FirebaseAuthServiceManager].
  static FirebaseAuthServiceManager get instance {
    _instance ??= FirebaseAuthServiceManager._init();
    return _instance!;
  }

  FirebaseAuthService? _firebaseAuthService;

  /// [firebaseAuthService] is a singleton instance of [FirebaseAuthService].
  FirebaseAuthService get firebaseAuthService {
    _firebaseAuthService ??= FirebaseAuthService(FirebaseAuth.instance);
    return _firebaseAuthService!;
  }
}
