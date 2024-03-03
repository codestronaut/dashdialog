import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../shared/shared.dart';
import '../managers/managers.dart';

class AuthForm extends StatelessWidget {
  const AuthForm({
    super.key,
    required this.emailFocusNode,
    required this.passwordFocusNode,
  });

  final FocusNode emailFocusNode;
  final FocusNode passwordFocusNode;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthFormBloc, AuthFormState>(
      builder: (context, state) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            GlobalLabeledWrapper(
              isRequired: true,
              label: context.l10n.emailAddressLabel,
              child: TextField(
                focusNode: emailFocusNode,
                keyboardType: TextInputType.emailAddress,
                decoration: context.inputDecoration.copyWith(
                  fillColor: Colors.white,
                  hintText: context.l10n.emailAddressHint,
                  errorText: !state.email.isPure
                      ? state.email.isNotValid
                          ? state.email.error?.getErrorText(context)
                          : null
                      : null,
                ),
                onChanged: (newValue) {
                  context.read<AuthFormBloc>().add(
                        AuthFormEvent.changeEmail(newValue),
                      );
                },
              ),
            ),
            context.spacingMd.vSpace,
            GlobalLabeledWrapper(
              isRequired: true,
              label: context.l10n.passwordLabel,
              child: TextField(
                focusNode: passwordFocusNode,
                obscureText: !state.isPasswordVisible,
                decoration: context.inputDecoration.copyWith(
                  fillColor: Colors.white,
                  hintText: context.l10n.passwordHint,
                  errorText: !state.password.isPure
                      ? state.password.isNotValid
                          ? state.password.error?.getErrorText(context)
                          : null
                      : null,
                  suffixIcon: IconButton(
                    onPressed: () {
                      context.read<AuthFormBloc>().add(
                            AuthFormEvent.setPasswordVisibility(
                              !state.isPasswordVisible,
                            ),
                          );
                    },
                    padding: EdgeInsets.all(context.spacingMd),
                    icon: Icon(
                      !state.isPasswordVisible
                          ? Icons.visibility_outlined
                          : Icons.visibility_off_outlined,
                      color: context.mindfulBrown,
                    ),
                  ),
                ),
                onChanged: (newValue) {
                  context.read<AuthFormBloc>().add(
                        AuthFormEvent.changePassword(newValue),
                      );
                },
              ),
            ),
          ],
        );
      },
    );
  }
}
