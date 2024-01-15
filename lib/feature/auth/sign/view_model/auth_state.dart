// Authentication State
import 'package:firebase_auth/firebase_auth.dart';

abstract class AuthenticationState {}

class AuthenticationInitial extends AuthenticationState {}

class AuthenticationLoading extends AuthenticationState {}

class AuthenticationSuccess extends AuthenticationState {
  AuthenticationSuccess(this.userCredential);
  final UserCredential userCredential;
}

class AuthenticationFailure extends AuthenticationState {
  AuthenticationFailure(this.error);
  final String error;
}
