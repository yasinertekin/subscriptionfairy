import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gen/src/index.dart';
import 'package:kartal/kartal.dart';
import 'package:subscriptionfairy/feature/auth/sign/view_model/auth_cubit.dart';
import 'package:subscriptionfairy/feature/auth/sign/view_model/auth_state.dart';
import 'package:subscriptionfairy/product/constants/string_constants.dart';
import 'package:subscriptionfairy/product/initialize/navigation/navigation_service.dart';
import 'package:subscriptionfairy/product/initialize/navigation/routes.dart';
import 'package:subscriptionfairy/product/widget/custom_button.dart';
import 'package:subscriptionfairy/product/widget/custom_text_field.dart';
import 'package:subscriptionfairy/product/widget/sign_in_with_google_button.dart';

part 'widget/forgot_passowrd_button.dart';
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

final class _SignViewBuilder extends StatelessWidget {
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
            // NavigationService.instance.navigateToPage(
            //  path: Routes.home,
            // );
          }
        },
        builder: (context, state) {
          final authCubit = context.watch<AuthenticationCubit>();

          if (state is AuthenticationLoading) {
            return const Center(child: CircularProgressIndicator.adaptive());
          } else if (state is AuthenticationSuccess) {
            return const Center(child: CircularProgressIndicator.adaptive());
          } else if (state is AuthenticationFailure) {
            WidgetsBinding.instance.addPostFrameCallback((_) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(
                    state.error,
                  ),
                ),
              );
            });
          }
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
      padding: const EdgeInsets.all(16),
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
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              CustomButton(
                title: StringConstants.signIn,
                formKey: formKey,
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    authCubit.signInWithEmailAndPassword(
                      emailController.text.trim(),
                      passwordController.text,
                    );
                  }
                },
              ),
              SizedBox(
                height: context.sized.dynamicHeight(0.02),
              ),
              const SignInWithGoogleButton(),
            ],
          ),
          const Spacer(),
        ],
      ),
    );
  }
}

final class _CustomForm extends StatelessWidget {
  const _CustomForm({
    required this.formKey,
    required this.emailController,
    required this.passwordController,
  });

  final GlobalKey<FormState> formKey;
  final TextEditingController emailController;
  final TextEditingController passwordController;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        children: [
          CustomTextField(
            formKey: formKey,
            hintText: 'Email',
            controller: emailController,
            keyboardType: TextInputType.emailAddress,
            textInputAction: TextInputAction.next,
            validatorText: 'Email is required',
          ),
          const SizedBox(height: 16),
          CustomTextField(
            formKey: formKey,
            hintText: 'Password',
            controller: passwordController,
            keyboardType: TextInputType.visiblePassword,
            textInputAction: TextInputAction.done,
            obscureText: true,
            validatorText: 'Password is required',
          ),
        ],
      ),
    );
  }
}
