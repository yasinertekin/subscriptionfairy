import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gen/src/index.dart';
import 'package:kartal/kartal.dart';
import 'package:subscriptionfairy/feature/auth/register/view_model/register_cubit.dart';
import 'package:subscriptionfairy/feature/auth/register/view_model/register_state.dart';
import 'package:subscriptionfairy/product/constants/string_constants.dart';
import 'package:subscriptionfairy/product/initialize/navigation/navigation_service.dart';
import 'package:subscriptionfairy/product/initialize/navigation/routes.dart';
import 'package:subscriptionfairy/product/widget/custom_button.dart';
import 'package:subscriptionfairy/product/widget/custom_text_field.dart';
import 'package:subscriptionfairy/product/widget/sign_in_with_google_button.dart';

/// This is the view for the register feature.
final class RegisterView extends StatelessWidget {
  /// This is the constructor for the register view.
  const RegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    final emailController = TextEditingController();
    final passwordController = TextEditingController();
    final confirmPasswordController = TextEditingController();

    return Scaffold(
      body: BlocConsumer<RegisterCubit, RegisterState>(
        listener: (context, state) {
          if (state is RegisterStateSuccess) {
            Navigator.of(context).pushNamedAndRemoveUntil(
              Routes.bottomNavigationBar,
              (route) => false,
            );
          }
        },
        builder: (context, state) {
          final authCubit = context.watch<RegisterCubit>();
          if (state is RegisterStateLoading) {
            return const Center(child: CircularProgressIndicator.adaptive());
          } else if (state is RegisterStateSuccess) {
          } else if (state is RegisterStateFailure) {
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
          return _RegisterBody(
            formKey: formKey,
            emailController: emailController,
            passwordController: passwordController,
            confirmPasswordController: confirmPasswordController,
            authCubit: authCubit,
          );
        },
      ),
    );
  }
}

final class _RegisterBody extends StatelessWidget {
  const _RegisterBody({
    required this.formKey,
    required this.emailController,
    required this.passwordController,
    required this.confirmPasswordController,
    required this.authCubit,
  });

  final GlobalKey<FormState> formKey;
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final TextEditingController confirmPasswordController;
  final RegisterCubit authCubit;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Column(
        children: [
          const Spacer(
            flex: 2,
          ),
          const _RegisterHeader(),
          _CustomForm(
            formKey: formKey,
            emailController: emailController,
            passwordController: passwordController,
            confirmPasswordController: confirmPasswordController,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              CustomButton(
                title: StringConstants.register,
                formKey: formKey,
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    if (passwordController.text ==
                        confirmPasswordController.text) {
                      authCubit.signUpWithEmailAndPassword(
                        emailController.text.trim(),
                        passwordController.text,
                      );
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text(
                            'Passwords do not match',
                          ),
                        ),
                      );
                    }
                  }
                },
              ),
              SizedBox(
                height: context.sized.dynamicHeight(0.02),
              ),
              if (!context.general.isKeyBoardOpen)
                const SignInWithGoogleButton()
              else
                const SizedBox.shrink(),
            ],
          ),
          const Spacer(),
        ],
      ),
    );
  }
}

final class _RegisterHeader extends StatelessWidget {
  const _RegisterHeader();

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Register',
            style: context.general.textTheme.headlineMedium,
          ),
          Text(
            'Please register to continue',
            style: context.general.textTheme.headlineSmall,
          ),
          Text.rich(
            TextSpan(
              text: 'Already have an account? ',
              children: [
                WidgetSpan(
                  child: GestureDetector(
                    onTap: () {
                      NavigationService.instance.navigateToPage(
                        path: Routes.initialRoute,
                      );
                    },
                    child: Text(
                      StringConstants.signIn,
                      style: context.general.textTheme.bodyLarge!.copyWith(
                        color: ColorName.colorRed,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
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
    required this.confirmPasswordController,
  });

  final GlobalKey<FormState> formKey;

  final TextEditingController emailController;
  final TextEditingController passwordController;
  final TextEditingController confirmPasswordController;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: SizedBox(
        height: context.sized.dynamicHeight(0.40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            CustomTextField(
              hintText: 'Enter your email',
              controller: emailController,
              keyboardType: TextInputType.emailAddress,
              textInputAction: TextInputAction.next,
              validatorText: 'Please enter your email',
              formKey: formKey,
            ),
            CustomTextField(
              formKey: formKey,
              hintText: 'Password',
              controller: passwordController,
              keyboardType: TextInputType.visiblePassword,
              textInputAction: TextInputAction.next,
              obscureText: true,
              validatorText: 'Password is required',
            ),
            CustomTextField(
              formKey: formKey,
              hintText: 'Confirm Password',
              controller: confirmPasswordController,
              keyboardType: TextInputType.visiblePassword,
              textInputAction: TextInputAction.done,
              obscureText: true,
              validatorText: 'Password is required',
            ),
          ],
        ),
      ),
    );
  }
}
