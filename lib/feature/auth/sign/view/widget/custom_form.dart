part of '../sign_view.dart';

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
            textInputAction: TextInputAction.next,
            formKey: formKey,
            hintText: LocaleKeys.auth_email.tr(),
            controller: emailController,
            keyboardType: TextInputType.emailAddress,
            validatorText: LocaleKeys.auth_emailRequired.tr(),
          ),
          context.sized.emptySizedHeightBoxLow,
          CustomTextField(
            formKey: formKey,
            hintText: LocaleKeys.auth_password.tr(),
            controller: passwordController,
            keyboardType: TextInputType.visiblePassword,
            obscureText: true,
            validatorText: LocaleKeys.auth_passwordRequired.tr(),
            textInputAction: TextInputAction.done,
          ),
        ],
      ),
    );
  }
}
