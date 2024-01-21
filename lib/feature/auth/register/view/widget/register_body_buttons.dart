part of '../register_view.dart';

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
        SizedBox(
          height: context.sized.dynamicHeight(0.03),
        ),
        const SignInWithGoogleButton(),
      ],
    );
  }
}
