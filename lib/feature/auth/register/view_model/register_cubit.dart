import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:subscriptionfairy/feature/auth/register/view_model/register_state.dart';
import 'package:subscriptionfairy/product/service/firebase_auth_interface.dart';

/// RegisterCubit
final class RegisterCubit extends Cubit<RegisterState> {
  /// Default constructor
  RegisterCubit(this.authService)
      : super(
          RegisterStateInitial(),
        );

  /// authService
  final IFirebaseAuthInterface authService;

  /// Sign Up
  Future<void> signUpWithEmailAndPassword(
    String email,
    String password,
  ) async {
    emit(RegisterStateLoading());
    try {
      final userCredential =
          await authService.createUserWithEmailAndPassword(email, password);
      emit(RegisterStateSuccess(userCredential));
    } catch (e) {
      emit(
        RegisterStateFailure('Sign in failed: $e'),
      );
    }
  }
}
