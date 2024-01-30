import 'package:flutter/material.dart';

/// [CustomTextField] is a custom text field widget.
final class CustomTextField extends StatelessWidget {
  /// [CustomTextField] is a custom text field widget.
  const CustomTextField({
    required this.hintText,
    required this.controller,
    required this.keyboardType,
    required this.validatorText,
    required this.formKey,
    required this.textInputAction,
    this.obscureText = false,
    super.key,
  });

  /// [hintText] is a hint text for text field.
  final String hintText;

  /// [controller] is a controller for text field.
  final TextEditingController controller;

  /// [obscureText] is a boolean value for obscure text.
  final bool obscureText;

  /// [keyboardType] is a keyboard type for text field.
  final TextInputType keyboardType;

  /// [textInputAction] is a text input action for text field.
  final TextInputAction textInputAction;

  /// [validatorText] is a validator text for text field.
  final String validatorText;

  /// [formKey] is a form key for text field.
  final GlobalKey<FormState> formKey;

  @override
  Widget build(BuildContext context) {
    final customTextFieldChangeNotifier = CustomTextFieldChangeNotifier();

    return ListenableBuilder(
      listenable: customTextFieldChangeNotifier,
      builder: (context, child) => TextFormField(
        validator: (value) {
          if (value == null || value.isEmpty) {
            return validatorText;
          }
          return null;
        },
        controller: controller,
        obscureText: obscureText && customTextFieldChangeNotifier.obscureText,
        keyboardType: keyboardType,
        textInputAction: textInputAction,
        decoration: InputDecoration(
          labelText: hintText,
          suffixIcon: obscureText
              ? IconButton(
                  onPressed: customTextFieldChangeNotifier.toggleObscureText,
                  icon: Icon(
                    customTextFieldChangeNotifier.obscureText
                        ? Icons.visibility
                        : Icons.visibility_off,
                  ),
                )
              : null,
        ),
      ),
    );
  }
}

/// [CustomTextFieldChangeNotifier] is a change notifier for custom text field.
final class CustomTextFieldChangeNotifier extends ChangeNotifier {
  bool _obscureText = true;

  /// [obscureText] is a boolean value for obscure text.
  bool get obscureText => _obscureText;

  /// [toggleObscureText] is a function to toggle obscure text.
  void toggleObscureText() {
    _obscureText = !_obscureText;
    notifyListeners();
  }
}
