part of 'auth_form_bloc.dart';

@freezed
class AuthFormEvent with _$AuthFormEvent {
  const factory AuthFormEvent.setPasswordVisibility(
    bool isPasswordVisible,
  ) = _SetPasswordVisibility;
  const factory AuthFormEvent.validateEmail() = _ValidateEmail;
  const factory AuthFormEvent.changeEmail(String newValue) = _ChangeEmail;
  const factory AuthFormEvent.validatePassword() = _ValidatePassword;
  const factory AuthFormEvent.changePassword(String newValue) = _ChangePassword;
  const factory AuthFormEvent.validateNewPassword() = _ValidateNewPassword;
  const factory AuthFormEvent.changeNewPassword(String newValue) =
      _ChangeNewPassword;
}
