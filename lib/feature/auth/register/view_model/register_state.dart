import 'package:firebase_auth/firebase_auth.dart';

abstract class RegisterState {}

final class RegisterStateInitial extends RegisterState {}

final class RegisterStateLoading extends RegisterState {}

final class RegisterStateSuccess extends RegisterState {
  RegisterStateSuccess(this.userCredential);
  final UserCredential userCredential;
}

final class RegisterStateFailure extends RegisterState {
  RegisterStateFailure(this.error);
  final String error;
}

final class RegisterStateWithPassword extends RegisterState {
  RegisterStateWithPassword({required this.isObscure});
  final bool isObscure;
}
