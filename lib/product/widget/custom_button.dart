import 'package:flutter/material.dart';
import 'package:gen/src/index.dart';
import 'package:kartal/kartal.dart';

/// CustomButton is a [StatelessWidget]
final class CustomButton extends StatelessWidget {
  /// Constructor of CustomButton
  const CustomButton({
    required this.formKey,
    required this.onPressed,
    required this.title,
    super.key,
  });

  /// This is the key for the form.
  final GlobalKey<FormState> formKey;

  /// This is the onPressed function for the button.
  final void Function()? onPressed;

  /// This is the title of the button.
  final String title;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: context.sized.dynamicHeight(0.42),
      height: context.sized.dynamicHeight(0.07),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          elevation: 3,
          backgroundColor: ColorName.colorRed,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
        onPressed: onPressed,
        child: Text(
          title,
          style: context.general.textTheme.titleLarge?.copyWith(
            color: ColorName.colorWhite,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
