import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:subscriptionfairy/feature/auth/register/view_model/register_cubit.dart';
import 'package:subscriptionfairy/feature/auth/sign/view_model/auth_cubit.dart';
import 'package:subscriptionfairy/feature/date_picker/view_model/date_picker_view_model.dart';
import 'package:subscriptionfairy/feature/home/view_model/home_view_model.dart';
import 'package:subscriptionfairy/feature/search/view_model/search_view_model.dart';
import 'package:subscriptionfairy/feature/subscriptions_detail/view_model/subscriptions_detail_view_model.dart';
import 'package:subscriptionfairy/product/core/app_cubit.dart';
import 'package:subscriptionfairy/product/service/firebase/firebase_auth_service_manager.dart';
import 'package:subscriptionfairy/product/service/firebase/firebase_firestore_service_manager.dart';
import 'package:subscriptionfairy/product/service/firestore/firabase_firestore_service.dart';

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
        BlocProvider<RegisterCubit>(
          create: (context) => RegisterCubit(
            FirebaseAuthServiceManager.instance.firebaseAuthService,
            FirebaseFireStoreService(
              FirebaseFirestoreServiceManager.instance.firebaseFirestore,
            ),
          ),
        ),
        BlocProvider<AppCubit>(
          create: (context) => AppCubit(
            FirebaseFireStoreService(
              FirebaseFirestoreServiceManager.instance.firebaseFirestore,
            ),
          ),
        ),
        Provider<DatePickerViewModel>(
          create: (context) => DatePickerViewModel(),
        ),
        ChangeNotifierProvider<SubscriptionsDetailViewModel>(
          create: (context) => SubscriptionsDetailViewModel(),
        ),
        ChangeNotifierProvider<HomeViewModel>(
          create: (context) => HomeViewModel(),
        ),
        ChangeNotifierProvider<SearchViewModel>(
          create: (context) => SearchViewModel(),
        ),
      ],
      child: child,
    );
  }
}
