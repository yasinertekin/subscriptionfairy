// Authentication State
import 'package:firebase_auth/firebase_auth.dart';

/// [AuthenticationState] is an abstract class that is responsible for
/// authentication states.
abstract class AuthenticationState {}

/// [AuthenticationInitial] is a class that is responsible for
final class AuthenticationInitial extends AuthenticationState {}

/// [AuthenticationLoading] is a class that is responsible for
final class AuthenticationLoading extends AuthenticationState {}

/// [AuthenticationSuccess] is a class that is responsible for
final class AuthenticationSuccess extends AuthenticationState {
  /// [AuthenticationSuccess] is a constructor that is responsible for
  AuthenticationSuccess(this.userCredential);

  /// [UserCredential] is a class that is responsible for
  final UserCredential userCredential;
}

/// [AuthenticationFailure] is a class that is responsible for
/// authentication failure.
final class AuthenticationFailure extends AuthenticationState {
  /// [AuthenticationFailure] is a constructor that is responsible for
  /// authentication failure.
  AuthenticationFailure(this.error);

  /// [error] is a string that is responsible for
  /// authentication failure.
  final String error;
}
