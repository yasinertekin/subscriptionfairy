import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:subscriptionfairy/feature/auth/register/view_model/register_state.dart';
import 'package:subscriptionfairy/product/model/users/users.dart';
import 'package:subscriptionfairy/product/service/firebase_auth_interface.dart';
import 'package:subscriptionfairy/product/service/firebase_firestore_service_interface.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit(this.authService, this.firebaseService)
      : super(RegisterStateInitial());

  final IFirebaseAuthInterface authService;
  final FirebaseFireStoreServiceInterface firebaseService;

  Future<void> createUsers(Users users) async {
    try {
      await firebaseService.createUsers(users);
    } catch (e) {
      emit(RegisterStateFailure('Error creating users: $e'));
    }
  }

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

  void togglePasswordVisibility(bool isObscure) {
    emit(RegisterStateWithPassword(isObscure: isObscure));
  }
}
