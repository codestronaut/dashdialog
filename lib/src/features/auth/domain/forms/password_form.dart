import 'package:flutter/widgets.dart';
import 'package:formz/formz.dart';

import '../../../../shared/shared.dart';

enum PasswordFormError {
  empty,
  missingLetter,
  missingNumber,
  missingCharacter,
  tooShort;

  bool get isEmpty => this == PasswordFormError.empty;
  bool get isMissingLetter => this == PasswordFormError.missingLetter;
  bool get isMissingNumber => this == PasswordFormError.missingNumber;
  bool get isMissingCharacter => this == PasswordFormError.missingCharacter;
  bool get isTooShort => this == PasswordFormError.tooShort;

  String getErrorText(BuildContext context) {
    switch (this) {
      case PasswordFormError.empty:
        return context.l10n.passwordEmptyError;
      case PasswordFormError.missingLetter:
        return context.l10n.passwordNotContainLetter;
      case PasswordFormError.missingNumber:
        return context.l10n.passwordNotContainNumber;
      case PasswordFormError.missingCharacter:
        return context.l10n.passwordNotContainChar;
      case PasswordFormError.tooShort:
        return context.l10n.passwordTooShort;
    }
  }
}

class PasswordForm extends FormzInput<String, PasswordFormError> {
  const PasswordForm.unvalidated([super.value = '']) : super.pure();
  const PasswordForm.validated([super.value = '']) : super.dirty();

  @override
  PasswordFormError? validator(String value) {
    return value.isEmpty ? PasswordFormError.empty : null;
  }
}

class NewPasswordForm extends FormzInput<String, PasswordFormError> {
  const NewPasswordForm.unvalidated([super.value = '']) : super.pure();
  const NewPasswordForm.validated([super.value = '']) : super.dirty();

  @override
  PasswordFormError? validator(String value) {
    const letter = r'^.*[a-zA-Z].*';
    const number = r'^.*[0-9].*';
    const specialCharacter = r'^.*[!@#\$&*~].*';
    const minCharacter = r'^.{8,}';

    return value.isEmpty
        ? PasswordFormError.empty
        : !RegExp(letter).hasMatch(value)
            ? PasswordFormError.missingLetter
            : !RegExp(number).hasMatch(value)
                ? PasswordFormError.missingNumber
                : !RegExp(specialCharacter).hasMatch(value)
                    ? PasswordFormError.missingCharacter
                    : !RegExp(minCharacter).hasMatch(value)
                        ? PasswordFormError.tooShort
                        : null;
  }
}
