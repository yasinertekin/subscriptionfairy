import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:subscriptionfairy/feature/auth/view_model/auth_cubit.dart';
import 'package:subscriptionfairy/product/firebase/firebase_auth_service_manager.dart';

/// [StateInitialize] is a class that contains all string constants.
final class StateInitialize extends StatelessWidget {
  /// Constructor of StateInitialize
  const StateInitialize({
    required this.child,
    super.key,
  });

  /// child
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AuthenticationCubit>(
          create: (context) => AuthenticationCubit(
            FirebaseAuthServiceManager.instance.firebaseAuthService,
          ),
        ),
      ],
      child: child,
    );
  }
}
