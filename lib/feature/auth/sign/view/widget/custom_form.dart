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
            hintText: StringConstants.email,
            controller: emailController,
            keyboardType: TextInputType.emailAddress,
            validatorText: StringConstants.emailIsRequired,
          ),
          context.sized.emptySizedHeightBoxLow,
          CustomTextField(
            formKey: formKey,
            hintText: StringConstants.password,
            controller: passwordController,
            keyboardType: TextInputType.visiblePassword,
            obscureText: true,
            validatorText: StringConstants.passwordIsRequired,
            textInputAction: TextInputAction.done,
          ),
        ],
      ),
    );
  }
}
