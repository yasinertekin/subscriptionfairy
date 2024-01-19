import 'package:firebase_auth/firebase_auth.dart';

abstract class RegisterState {}

class RegisterStateInitial extends RegisterState {}

class RegisterStateLoading extends RegisterState {}

class RegisterStateSuccess extends RegisterState {
  RegisterStateSuccess(this.userCredential);
  final UserCredential userCredential;
}

class RegisterStateFailure extends RegisterState {
  RegisterStateFailure(this.error);
  final String error;
}

class RegisterStateWithPassword extends RegisterState {
  RegisterStateWithPassword({required this.isObscure});
  final bool isObscure;
}
