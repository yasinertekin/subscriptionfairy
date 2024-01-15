// Authentication Cubit
import 'package:bloc/bloc.dart';
import 'package:subscriptionfairy/feature/auth/view_model/auth_state.dart';
import 'package:subscriptionfairy/product/service/firebase_auth_interface.dart';

final class AuthenticationCubit extends Cubit<AuthenticationState> {
  AuthenticationCubit(this.authService)
      : super(
          AuthenticationInitial(),
        );
  final IFirebaseAuthInterface authService;

  // Register
  Future<void> registerWithEmailAndPassword(
    String email,
    String password,
  ) async {
    emit(AuthenticationLoading());
    try {
      final userCredential =
          await authService.createUserWithEmailAndPassword(email, password);
      emit(AuthenticationSuccess(userCredential));
    } catch (e) {
      emit(AuthenticationFailure('Registration failed: $e'));
    }
  }

  // Sign In
  Future<void> signInWithEmailAndPassword(
    String email,
    String password,
  ) async {
    emit(AuthenticationLoading());
    try {
      final userCredential =
          await authService.signInWithEmailAndPassword(email, password);
      emit(AuthenticationSuccess(userCredential));
    } catch (e) {
      emit(AuthenticationFailure('Sign in failed: $e'));
    }
  }

  // Sign Out
  Future<void> signOut() async {
    emit(AuthenticationLoading());
    try {
      await authService.signOut();
      emit(AuthenticationInitial());
    } catch (e) {
      emit(AuthenticationFailure('Sign out failed: $e'));
    }
  }
}
