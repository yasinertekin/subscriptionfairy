import 'package:firebase_auth/firebase_auth.dart';

/// [IFirebaseAuthInterface] is an abstract class
/// that contains all the firebase auth service
abstract class IFirebaseAuthInterface {
  /// [IFirebaseAuthInterface] constructor
  IFirebaseAuthInterface(
    this.firebaseAuth,
  );

  /// [firebaseAuth] is a final variable of [FirebaseAuth]
  final FirebaseAuth firebaseAuth;

  /// createUserWithEmailAndPassword is a function that returns
  ///  a [Future] of [UserCredential]
  Future<UserCredential> createUserWithEmailAndPassword(
    String email,
    String password,
  );

  /// signInWithEmailAndPassword is a function that returns
  /// a [Future] of [UserCredential]
  Future<UserCredential> signInWithEmailAndPassword(
    String email,
    String password,
  );

  /// signOut is a function that returns a [Future] of [void]
  Future<void> signOut();
}
