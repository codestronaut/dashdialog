import 'package:flutter/material.dart';
import 'package:formz/formz.dart';

import '../../../../shared/shared.dart';

enum EmailFormError {
  empty;

  bool get isEmpty => this == EmailFormError.empty;

  String getErrorText(BuildContext context) {
    switch (this) {
      case EmailFormError.empty:
        return context.l10n.emailAddressError;
    }
  }
}

class EmailForm extends FormzInput<String, EmailFormError> {
  const EmailForm.unvalidated([super.value = '']) : super.pure();
  const EmailForm.validated([super.value = '']) : super.dirty();

  @override
  EmailFormError? validator(String value) {
    return value.isEmpty ? EmailFormError.empty : null;
  }
}
