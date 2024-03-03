part of 'auth_form_bloc.dart';

@freezed
class AuthFormState with _$AuthFormState {
  const factory AuthFormState({
    @Default(false) bool isPasswordVisible,
    @Default(EmailForm.unvalidated()) EmailForm email,
    @Default(PasswordForm.unvalidated()) PasswordForm password,
    @Default(NewPasswordForm.unvalidated()) NewPasswordForm newPassword,
  }) = _AuthFormState;
}
