part of '../sign_view.dart';

final class _ForgotPasswordButton extends StatelessWidget {
  const _ForgotPasswordButton();

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: TextButton(
        onPressed: () {},
        child: Text(
          LocaleKeys.auth_login_forgotPassword,
          style: context.general.textTheme.bodyLarge?.copyWith(
            color: ColorName.colorRed,
          ),
        ).tr(),
      ),
    );
  }
}
