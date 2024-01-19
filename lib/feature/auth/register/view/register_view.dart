import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
// ignore: implementation_imports
import 'package:gen/src/index.dart';
import 'package:kartal/kartal.dart';
import 'package:subscriptionfairy/feature/auth/register/view_model/register_cubit.dart';
import 'package:subscriptionfairy/feature/auth/register/view_model/register_state.dart';
import 'package:subscriptionfairy/product/constants/string_constants.dart';
import 'package:subscriptionfairy/product/initialize/navigation/navigation_service.dart';
import 'package:subscriptionfairy/product/initialize/navigation/routes.dart';
import 'package:subscriptionfairy/product/mixin/custom_scaffold_messenger.dart';
import 'package:subscriptionfairy/product/utility/padding/project_padding.dart';
import 'package:subscriptionfairy/product/widget/custom_button.dart';
import 'package:subscriptionfairy/product/widget/custom_loading.dart';

part 'widget/register_body.dart';
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
    final confirmPasswordController = TextEditingController();
    return Scaffold(
      body: _CustomBlocConsumer(
        formKey: formKey,
        emailController: emailController,
        passwordController: passwordController,
        confirmPasswordController: confirmPasswordController,
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
    required this.confirmPasswordController,
  });

  final GlobalKey<FormState> formKey;
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final TextEditingController confirmPasswordController;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RegisterCubit, RegisterState>(
      listener: (context, state) {
        if (state is RegisterStateSuccess) {
          NavigationService.instance.navigateToPage(
            path: Routes.bottomNavigationBar,
          );
        }
      },
      builder: (context, state) {
        var isObscure = true;

        if (state is RegisterStateWithPassword) {
          isObscure = state.isObscure;
        }
        final authCubit = context.watch<RegisterCubit>();
        if (state is RegisterStateLoading) {
          return const CustomLoading();
        } else if (state is RegisterStateSuccess) {
        } else if (state is RegisterStateFailure) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            showSnackBar(context, state.error);
          });
        }
        return _RegisterBody(
          formKey: formKey,
          emailController: emailController,
          passwordController: passwordController,
          confirmPasswordController: confirmPasswordController,
          authCubit: authCubit,
          isObscure: isObscure,
        );
      },
    );
  }
}

final class _CustomForm extends StatelessWidget {
  const _CustomForm({
    required this.formKey,
    required this.emailController,
    required this.passwordController,
    required this.confirmPasswordController,
    required this.isObscure,
  });

  final GlobalKey<FormState> formKey;

  final TextEditingController emailController;
  final TextEditingController passwordController;
  final TextEditingController confirmPasswordController;
  final bool isObscure;

  @override
  Widget build(BuildContext context) {
    final authCubit = context.watch<RegisterCubit>().state;
    return Form(
      key: formKey,
      child: Column(
        children: [
          TextFormField(
            controller: emailController,
            keyboardType: TextInputType.emailAddress,
            textInputAction: TextInputAction.next,
            decoration: const InputDecoration(
              labelText: StringConstants.email,
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return StringConstants.emailIsRequired;
              }
              return null;
            },
          ),
          TextFormField(
            controller: confirmPasswordController,
            keyboardType:
                isObscure ? TextInputType.visiblePassword : TextInputType.text,
            decoration: InputDecoration(
              labelText: StringConstants.email,
              suffixIcon: IconButton(
                onPressed: () {
                  context.read<RegisterCubit>().togglePasswordVisibility(
                        !isObscure,
                      );
                },
                icon: Icon(
                  isObscure ? Icons.visibility : Icons.visibility_off,
                ),
              ),
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return StringConstants.emailIsRequired;
              }
              return null;
            },
          ),
          context.sized.emptySizedHeightBoxNormal,
        ],
      ),
    );
  }
}
