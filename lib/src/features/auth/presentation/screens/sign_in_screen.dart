import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/core.dart';
import '../../../../shared/shared.dart';
import '../managers/managers.dart';
import '../widgets/widgets.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  late final AuthFormBloc authFormBloc;

  final emailFocusNode = FocusNode();
  final passwordFocusNode = FocusNode();

  @override
  void initState() {
    authFormBloc = locator<AuthFormBloc>();
    emailFocusNode.addListener(() {
      if (!emailFocusNode.hasFocus) {
        authFormBloc.add(const AuthFormEvent.validateEmail());
      }
    });
    passwordFocusNode.addListener(() {
      if (!passwordFocusNode.hasFocus) {
        authFormBloc.add(const AuthFormEvent.validatePassword());
      }
    });

    super.initState();
  }

  @override
  void dispose() {
    emailFocusNode.dispose();
    passwordFocusNode.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => authFormBloc),
      ],
      child: GestureDetector(
        onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          body: SafeArea(
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: context.spacingMd,
                vertical: context.spacingXlg,
              ),
              child: Column(
                children: [
                  Expanded(
                    child: Column(
                      children: [
                        Text.rich(
                          TextSpan(
                            text: context.l10n.firstAppName,
                            style: context.semiBold.copyWith(
                              fontSize: context.spacingXlg,
                            ),
                            children: [
                              TextSpan(
                                text: context.l10n.lastAppName,
                                style: context.bold.copyWith(
                                  color: context.mindfulGreen,
                                ),
                              ),
                            ],
                          ),
                        ),
                        (context.spacingXlg * 2.0).vSpace,
                        AuthForm(
                          emailFocusNode: emailFocusNode,
                          passwordFocusNode: passwordFocusNode,
                        ),
                        context.spacingXlg.vSpace,
                        SizedBox(
                          width: context.deviceWidth,
                          child: BlocBuilder<AuthFormBloc, AuthFormState>(
                            builder: (context, state) {
                              return GlobalButton.filled(
                                onTap: () {},
                                enable: state.email.isValid &&
                                    state.password.isValid,
                                child: Text(context.l10n.signInLabel),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                  Column(
                    children: [
                      Text.rich(
                        TextSpan(
                          text: context.l10n.dontHaveAccountLabel,
                          style: context.medium.copyWith(
                            color: context.grayRockDarker,
                            fontSize: context.spacingMd,
                          ),
                          children: [
                            WidgetSpan(child: context.spacingXxs.hSpace),
                            TextSpan(
                              text: context.l10n.signUpLabel,
                              style: context.bold.copyWith(
                                color: context.mindfulOrange,
                                fontSize: context.spacingMd,
                                decoration: TextDecoration.underline,
                                decorationColor: context.mindfulOrange,
                              ),
                            ),
                          ],
                        ),
                      ),
                      context.spacingXs.vSpace,
                      Text(
                        context.l10n.forgotPasswordLabel,
                        style: context.bold.copyWith(
                          color: context.mindfulBrownLight,
                          fontSize: context.spacingMd,
                          decoration: TextDecoration.underline,
                          decorationColor: context.mindfulBrownLight,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
