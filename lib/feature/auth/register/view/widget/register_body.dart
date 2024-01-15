part of '../register_view.dart';

final class _RegisterBody extends StatelessWidget with CustomScaffoldMessenger {
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
            confirmPasswordController: confirmPasswordController,
          ),
          _RegisterBodyButtons(
            formKey,
            () => _onPressedOperation(context),
          ),
          const Spacer(),
        ],
      ),
    );
  }

  void _onPressedOperation(BuildContext context) {
    if (formKey.currentState!.validate()) {
      if (passwordController.text == confirmPasswordController.text) {
        authCubit.signUpWithEmailAndPassword(
          emailController.text.trim(),
          passwordController.text,
        );
      } else {
        showSnackBar(
          context,
          StringConstants.passwordDoNotMatch,
        );
      }
    }
  }
}

final class _RegisterBodyButtons extends StatelessWidget {
  const _RegisterBodyButtons(
    this.formKey,
    this.onPressed,
  );

  final GlobalKey<FormState> formKey;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        CustomButton(
          title: StringConstants.register,
          formKey: formKey,
          onPressed: onPressed,
        ),
      ],
    );
  }
}
