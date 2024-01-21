import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:subscriptionfairy/feature/auth/register/view_model/register_state.dart';
import 'package:subscriptionfairy/product/model/users/users.dart';
import 'package:subscriptionfairy/product/service/auth/firebase_auth_interface.dart';
import 'package:subscriptionfairy/product/service/firestore/firebase_firestore_service_interface.dart';

/// RegisterCubit is a class that extends Cubit and is used to manage
/// the state of the RegisterView.
final class RegisterCubit extends Cubit<RegisterState> {
  /// RegisterCubit constructor
  RegisterCubit(this.authService, this.firebaseService)
      : super(RegisterStateInitial());

  /// authService is an instance of the IFirebaseAuthInterface
  final IFirebaseAuthInterface authService;

  /// firebaseService is an instance of the IFirebaseFireStoreServiceInterface
  final FirebaseFireStoreServiceInterface firebaseService;

  /// createUsers is a method that creates a new user in the database
  Future<void> createUsers(Users users) async {
    try {
      await firebaseService.createUsers(users);
    } catch (e) {
      emit(RegisterStateFailure('Error creating users: $e'));
    }
  }

  /// signInWithEmailAndPassword is a method that
  ///  signs in a user with email and password
  Future<void> signUpWithEmailAndPassword(String email, String password) async {
    emit(RegisterStateLoading());
    try {
      final userCredential =
          await authService.createUserWithEmailAndPassword(email, password);
      emit(RegisterStateSuccess(userCredential));
      await createUsers(
        Users(
          email: email,
          username: '',
          usersUid: userCredential.user!.uid,
          subscriptionList: [],
        ),
      );
    } catch (e) {
      emit(RegisterStateFailure('Sign in failed: $e'));
    }
  }

  /// togglePasswordVisibility is a method
  ///  that toggles the password visibility
  void togglePasswordVisibility(bool isObscure) {
    emit(RegisterStateWithPassword(isObscure: isObscure));
  }
}
