// Authentication Cubit
import 'package:bloc/bloc.dart';
import 'package:subscriptionfairy/feature/auth/sign/view_model/auth_state.dart';
import 'package:subscriptionfairy/product/service/firebase_auth_interface.dart';

/// [AuthenticationCubit] is a cubit that is responsible for
final class AuthenticationCubit extends Cubit<AuthenticationState> {
  /// Constructor of AuthenticationCubit
  AuthenticationCubit(this.authService)
      : super(
          AuthenticationInitial(),
        );

  /// [IFirebaseAuthInterface] is an interface that is responsible for
  /// authentication operations.
  final IFirebaseAuthInterface authService;

  /// Sign In
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
}
