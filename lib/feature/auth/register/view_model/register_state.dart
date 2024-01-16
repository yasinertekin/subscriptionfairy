import 'package:firebase_auth/firebase_auth.dart';

/// RegisterState
abstract class RegisterState {}

/// RegisterState
final class RegisterStateInitial extends RegisterState {}

/// RegisterStateLoading
final class RegisterStateLoading extends RegisterState {}

/// RegisterStateSuccess
final class RegisterStateSuccess extends RegisterState {
  /// Default constructor
  RegisterStateSuccess(this.userCredential);

  /// userCredential
  final UserCredential userCredential;
}

/// RegisterStateFailure
final class RegisterStateFailure extends RegisterState {
  /// Default constructor
  RegisterStateFailure(this.error);

  /// error
  final String error;
}
