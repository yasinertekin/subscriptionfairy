part of '../register_view.dart';

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
            textInputAction: TextInputAction.next,
            validatorText: LocaleKeys.auth_emailRequired.tr(),
            controller: emailController,
            hintText: LocaleKeys.auth_email.tr(),
            keyboardType: TextInputType.emailAddress,
          ),
          context.sized.emptySizedHeightBoxLow,
          CustomTextField(
            formKey: formKey,
            textInputAction: TextInputAction.done,
            validatorText: LocaleKeys.auth_passwordRequired.tr(),
            controller: passwordController,
            obscureText: true,
            hintText: LocaleKeys.auth_password.tr(),
            keyboardType: TextInputType.visiblePassword,
          ),
        ],
      ),
    );
  }
}
