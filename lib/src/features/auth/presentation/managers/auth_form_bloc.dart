import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../../domain/domain.dart';

part 'auth_form_bloc.freezed.dart';
part 'auth_form_event.dart';
part 'auth_form_state.dart';

@injectable
class AuthFormBloc extends Bloc<AuthFormEvent, AuthFormState> {
  AuthFormBloc() : super(const AuthFormState()) {
    on<_SetPasswordVisibility>((event, emit) {
      emit(state.copyWith(isPasswordVisible: event.isPasswordVisible));
    });

    on<_ChangeEmail>((event, emit) {
      final prevState = state;
      final prevEmailState = prevState.email;
      final shouldValidate = prevEmailState.isNotValid;
      final currEmailState = shouldValidate
          ? EmailForm.validated(event.newValue)
          : EmailForm.unvalidated(event.newValue);

      final currState = state.copyWith(email: currEmailState);
      emit(currState);
    });

    on<_ValidateEmail>((event, emit) {
      final prevState = state;
      final prevEmailState = prevState.email;
      final prevEmailValue = prevEmailState.value;
      final currEmailState = EmailForm.validated(
        prevEmailValue,
      );

      final currState = prevState.copyWith(email: currEmailState);
      emit(currState);
    });

    on<_ChangePassword>((event, emit) {
      final prevState = state;
      final prevPasswordState = prevState.password;
      final shouldValidate = prevPasswordState.isNotValid;
      final currPasswordState = shouldValidate
          ? PasswordForm.validated(event.newValue)
          : PasswordForm.unvalidated(event.newValue);

      final currState = state.copyWith(password: currPasswordState);
      emit(currState);
    });

    on<_ValidatePassword>((event, emit) {
      final prevState = state;
      final prevPasswordState = prevState.password;
      final prevPasswordValue = prevPasswordState.value;
      final currPasswordState = PasswordForm.validated(
        prevPasswordValue,
      );

      final currState = prevState.copyWith(password: currPasswordState);
      emit(currState);
    });

    on<_ChangeNewPassword>((event, emit) {
      final prevState = state;
      final prevNewPasswordState = prevState.newPassword;
      final shouldValidate = prevNewPasswordState.isNotValid;
      final currNewPasswordState = shouldValidate
          ? NewPasswordForm.validated(event.newValue)
          : NewPasswordForm.unvalidated(event.newValue);

      final currState = state.copyWith(newPassword: currNewPasswordState);
      emit(currState);
    });

    on<_ValidateNewPassword>((event, emit) {
      final prevState = state;
      final prevNewPasswordState = prevState.newPassword;
      final prevNewPasswordValue = prevNewPasswordState.value;
      final currNewPasswordState = NewPasswordForm.validated(
        prevNewPasswordValue,
      );

      final currState = prevState.copyWith(newPassword: currNewPasswordState);
      emit(currState);
    });
  }
}
