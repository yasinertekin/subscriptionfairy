import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gen/src/index.dart';
import 'package:kartal/kartal.dart';
import 'package:subscriptionfairy/feature/auth/view_model/auth_cubit.dart';
import 'package:subscriptionfairy/feature/auth/view_model/auth_state.dart';
import 'package:subscriptionfairy/product/constants/string_constants.dart';
import 'package:subscriptionfairy/product/initialize/navigation/navigation_service.dart';
import 'package:subscriptionfairy/product/initialize/navigation/routes.dart';
import 'package:subscriptionfairy/product/widget/custom_text_field.dart';

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
            NavigationService.instance.navigateToPage(
              path: Routes.home,
            );
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
          Form(
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
          ),
          const _ForgotPasswordButton(),
          _CustomButton(
            formKey: formKey,
            authCubit: authCubit,
            emailController: emailController,
            passwordController: passwordController,
          ),
          SizedBox(
            height: context.sized.dynamicHeight(0.02),
          ),
          const _SignInWithGoogleButton(),
          const Spacer(),
        ],
      ),
    );
  }
}

final class _SignInWithGoogleButton extends StatelessWidget {
  const _SignInWithGoogleButton();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: context.sized.dynamicHeight(0.42),
      height: context.sized.dynamicHeight(0.07),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          elevation: 5,
          surfaceTintColor: ColorName.colorWhite,
          backgroundColor: ColorName.colorWhite,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
        onPressed: () {},
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Assets.icons.icGoogleLogo.svg(
              package: 'gen',
            ),
            const SizedBox(width: 8),
            Text(
              StringConstants.signInWithGoogle,
              style: context.general.textTheme.titleLarge!.copyWith(
                color: ColorName.colorBlack,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

final class _CustomButton extends StatelessWidget {
  const _CustomButton({
    required this.formKey,
    required this.authCubit,
    required this.emailController,
    required this.passwordController,
  });

  final GlobalKey<FormState> formKey;
  final AuthenticationCubit authCubit;
  final TextEditingController emailController;
  final TextEditingController passwordController;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: context.sized.dynamicHeight(0.42),
      height: context.sized.dynamicHeight(0.07),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          elevation: 3,
          backgroundColor: ColorName.colorRed,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
        onPressed: () {
          if (formKey.currentState?.validate() ?? false) {
            authCubit.signInWithEmailAndPassword(
              emailController.text.trim(),
              passwordController.text,
            );
          }
        },
        child: Text(
          StringConstants.signIn,
          style: context.general.textTheme.titleLarge?.copyWith(
            color: ColorName.colorWhite,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
