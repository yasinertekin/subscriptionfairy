import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:subscriptionfairy/product/core/app_cubit.dart';
import 'package:subscriptionfairy/product/core/app_state.dart';
import 'package:subscriptionfairy/product/initialize/language/locale_keys.g.dart';
import 'package:subscriptionfairy/product/widget/lottie/custom_loading.dart';

/// CommonBlocBuilder
final class CommonBlocBuilder extends StatelessWidget {
  /// Default constructor
  const CommonBlocBuilder({
    required this.builder,
    required Key key,
  }) : super(key: key);

  /// Builder
  final Widget Function(BuildContext context, AppState state) builder;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppCubit, AppState>(
      builder: (context, state) {
        if (state is AppLoadingState) {
          return const CustomLoading();
        } else if (state is AppLoadedState) {
          return builder(context, state);
        } else if (state is AppErrorState) {
          return Center(
            child: Text(state.error),
          );
        } else {
          return Center(
            child: const Text(LocaleKeys.dashboard_unknownState).tr(),
          );
        }
      },
    );
  }
}
