import 'package:firebase_auth/firebase_auth.dart';
import 'package:subscriptionfairy/product/service/auth/firebase_auth_interface.dart';

/// [FirebaseAuthService] is a class that implements [IFirebaseAuthInterface]
final class FirebaseAuthService implements IFirebaseAuthInterface {
  /// [FirebaseAuthService] is a class that implements [IFirebaseAuthInterface]
  FirebaseAuthService(this.firebaseAuth);

  @override
  final FirebaseAuth firebaseAuth;

  @override
  Future<UserCredential> createUserWithEmailAndPassword(
    String email,
    String password,
  ) async {
    final userCredential = await firebaseAuth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
    return userCredential;
  }

  @override
  Future<UserCredential> signInWithEmailAndPassword(
    String email,
    String password,
  ) async {
    final userCredential = await firebaseAuth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
    return userCredential;
  }

  @override
  Future<void> signOut() async {
    await firebaseAuth.signOut();
  }
}
