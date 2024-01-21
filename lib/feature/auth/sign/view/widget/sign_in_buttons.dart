part of '../sign_view.dart';

final class _SignInButtons extends StatelessWidget {
  const _SignInButtons({
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
    return Column(
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
        context.sized.emptySizedHeightBoxLow,
        const SignInWithGoogleButton(),
      ],
    );
  }
}
