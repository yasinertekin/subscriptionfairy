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
            validatorText: StringConstants.emailIsRequired,
            controller: emailController,
            hintText: StringConstants.email,
            keyboardType: TextInputType.emailAddress,
          ),
          SizedBox(
            height: context.sized.dynamicHeight(0.03),
          ),
          CustomTextField(
            formKey: formKey,
            textInputAction: TextInputAction.done,
            validatorText: StringConstants.passwordIsRequired,
            controller: passwordController,
            obscureText: true,
            hintText: StringConstants.password,
            keyboardType: TextInputType.visiblePassword,
          ),
        ],
      ),
    );
  }
}
