import 'package:firebase_auth/firebase_auth.dart';
import 'package:subscriptionfairy/product/service/auth/firebase_auth_service.dart';

/// [FirebaseAuthServiceManager] is a class that contains all string constants.
final class FirebaseAuthServiceManager {
  FirebaseAuthServiceManager._init();
  static final FirebaseAuthServiceManager _instance =
      FirebaseAuthServiceManager._init();

  /// [instance] is a function that returns instance
  static FirebaseAuthServiceManager get instance => _instance;

  FirebaseAuthService? _firebaseAuthService;

  /// [firebaseAuthService] is a function that returns firebaseAuthService
  FirebaseAuthService get firebaseAuthService {
    _firebaseAuthService ??= FirebaseAuthService(FirebaseAuth.instance);
    return _firebaseAuthService!;
  }
}
