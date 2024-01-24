import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
// ignore: implementation_imports
import 'package:gen/src/index.dart';
import 'package:kartal/kartal.dart';
import 'package:subscriptionfairy/feature/auth/authantication_state/authantication_state.dart';
import 'package:subscriptionfairy/feature/auth/register/view_model/register_cubit.dart';
import 'package:subscriptionfairy/product/initialize/language/locale_keys.g.dart';
import 'package:subscriptionfairy/product/initialize/navigation/navigation_service.dart';
import 'package:subscriptionfairy/product/initialize/navigation/routes.dart';
import 'package:subscriptionfairy/product/mixin/custom_scaffold_messenger.dart';
import 'package:subscriptionfairy/product/utility/padding/project_padding.dart';
import 'package:subscriptionfairy/product/widget/button/custom_button.dart';
import 'package:subscriptionfairy/product/widget/button/sign_in_with_google_button.dart';
import 'package:subscriptionfairy/product/widget/custom_loading.dart';
import 'package:subscriptionfairy/product/widget/custom_text_field.dart';

part 'widget/custom_form.dart';
part 'widget/register_body_buttons.dart';
part 'widget/register_header.dart';

/// This is the view for the register feature.
final class RegisterView extends StatelessWidget {
  /// This is the constructor for the register view.
  const RegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    final emailController = TextEditingController();
    final passwordController = TextEditingController();
    return Scaffold(
      body: _CustomBlocConsumer(
        formKey: formKey,
        emailController: emailController,
        passwordController: passwordController,
      ),
    );
  }
}

final class _CustomBlocConsumer extends StatelessWidget
    with CustomScaffoldMessenger {
  const _CustomBlocConsumer({
    required this.formKey,
    required this.emailController,
    required this.passwordController,
  });

  final GlobalKey<FormState> formKey;
  final TextEditingController emailController;
  final TextEditingController passwordController;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RegisterCubit, AuthenticationState>(
      listener: (context, state) {
        if (state is AuthenticationSuccess) {
          NavigationService.instance.navigateToPage(
            path: Routes.bottomNavigationBar,
          );
        }
        if (state is AuthenticationFailure) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            showSnackBar(context, state.error);
          });
        }
      },
      builder: (context, state) {
        final authCubit = context.watch<RegisterCubit>();
        if (state is AuthenticationLoading) {
          return const CustomLoading();
        } else if (state is AuthenticationSuccess) {
        } else if (state is AuthenticationFailure) {}
        return _RegisterBody(
          formKey: formKey,
          emailController: emailController,
          passwordController: passwordController,
          authCubit: authCubit,
        );
      },
    );
  }
}

final class _RegisterBody extends StatelessWidget with CustomScaffoldMessenger {
  const _RegisterBody({
    required this.formKey,
    required this.emailController,
    required this.passwordController,
    required this.authCubit,
  });

  final GlobalKey<FormState> formKey;
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final RegisterCubit authCubit;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const ProjectPadding.allSmall(),
      child: Column(
        children: [
          const Spacer(
            flex: 2,
          ),
          const _RegisterHeader(),
          const Spacer(),
          _CustomForm(
            formKey: formKey,
            emailController: emailController,
            passwordController: passwordController,
          ),
          const Spacer(),
          _RegisterBodyButtons(
            formKey,
            () => _registerOperation(context),
          ),
          const Spacer(),
        ],
      ),
    );
  }

  void _registerOperation(BuildContext context) {
    if (formKey.currentState!.validate()) {
      authCubit.signUpWithEmailAndPassword(
        emailController.text.trim(),
        passwordController.text,
      );
    }
  }
}
