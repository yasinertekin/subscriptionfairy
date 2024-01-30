import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
// ignore: implementation_imports
import 'package:gen/src/index.dart';
import 'package:kartal/kartal.dart';
import 'package:subscriptionfairy/feature/auth/sign/view_model/auth_cubit.dart';
import 'package:subscriptionfairy/feature/auth/sign/view_model/auth_state.dart';
import 'package:subscriptionfairy/product/initialize/language/locale_keys.g.dart';
import 'package:subscriptionfairy/product/initialize/navigation/navigation_service.dart';
import 'package:subscriptionfairy/product/initialize/navigation/routes.dart';
import 'package:subscriptionfairy/product/mixin/custom_scaffold_messenger.dart';
import 'package:subscriptionfairy/product/utility/padding/project_padding.dart';
import 'package:subscriptionfairy/product/widget/button/custom_button.dart';
import 'package:subscriptionfairy/product/widget/button/sign_in_with_google_button.dart';
import 'package:subscriptionfairy/product/widget/lottie/custom_loading.dart';
import 'package:subscriptionfairy/product/widget/text_field/custom_text_field.dart';

part 'widget/custom_form.dart';
part 'widget/forgot_passowrd_button.dart';
part 'widget/sign_in_buttons.dart';
part 'widget/sign_up_text_rich.dart';

/// SignView is a [StatelessWidget]
/// which is responsible for showing sign in page.
/// It has a [SignView] which is used for form validation.
final class SignView extends StatelessWidget {
  /// Constructor of SignView
  const SignView({super.key});

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    return _SignViewBuilder(
      formKey: formKey,
    );
  }
}

final class _SignViewBuilder extends StatelessWidget
    with CustomScaffoldMessenger {
  const _SignViewBuilder({
    required this.formKey,
  });

  final GlobalKey<FormState> formKey;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<AuthenticationCubit, AuthenticationState>(
        listener: (context, state) {
          if (state is AuthenticationSuccess) {
            NavigationService.instance.navigateToPage(
              path: Routes.bottomNavigationBar,
            );
          } else if (state is AuthenticationFailure) {
            WidgetsBinding.instance.addPostFrameCallback((_) {
              showSnackBar(
                context,
                state.error,
              );
            });
          }
        },
        builder: (context, state) {
          final authCubit = context.watch<AuthenticationCubit>();

          if (state is AuthenticationLoading) {
            return const CustomLoading();
          } else if (state is AuthenticationSuccess) {
          } else if (state is AuthenticationFailure) {}
          return _SignViewBody(formKey: formKey, authCubit: authCubit);
        },
      ),
    );
  }
}

final class _SignViewBody extends StatelessWidget {
  const _SignViewBody({
    required this.formKey,
    required this.authCubit,
  });

  final GlobalKey<FormState> formKey;
  final AuthenticationCubit authCubit;

  @override
  Widget build(BuildContext context) {
    final emailController = TextEditingController();
    final passwordController = TextEditingController();
    return Padding(
      padding: const ProjectPadding.allMedium(),
      child: Column(
        children: <Widget>[
          const Spacer(),
          const _SignUpTextRich(),
          const Spacer(),
          _CustomForm(
            formKey: formKey,
            emailController: emailController,
            passwordController: passwordController,
          ),
          const _ForgotPasswordButton(),
          _SignInButtons(
            formKey: formKey,
            authCubit: authCubit,
            emailController: emailController,
            passwordController: passwordController,
          ),
          const Spacer(),
        ],
      ),
    );
  }
}
