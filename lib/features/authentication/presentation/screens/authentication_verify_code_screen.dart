import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:logger/logger.dart';
import 'package:project_z/core/di/di.dart';
import 'package:project_z/core/routing/router.dart';
import 'package:project_z/features/authentication/presentation/bloc/verify_code/authentication_verify_code_bloc.dart';
import 'package:project_z/features/authentication/presentation/widgets/loading_pin_code_input_widget.dart';
import 'package:project_z/features/authentication/presentation/widgets/widgets.dart';
import 'package:project_z/shared/consts/grey_elevated_button_style.dart';
import 'package:project_z/shared/consts/text_field_style.dart';
import 'package:project_z/shared/consts/text_style_title.dart';

@RoutePage()
class AuthenticationVerifyCodeScreen extends StatelessWidget {
  const AuthenticationVerifyCodeScreen(this._username, {super.key});

  final String _username;

  void _goBack(BuildContext context) {
    final router = AutoRouter.of(context);
    if (router.canPop()) {
      router.popForced();
    }
  }

  void _goToApp(BuildContext context) {
    Logger().i(AutoRouter.of(context).stack.toString());
    AutoRouter.of(context).replaceAll([const ProjectZShellRoute()]);
    Logger().i(AutoRouter.of(context).stack.toString());
  }

  void _onClickTelegram() {
    //todo
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ColoredBox(
        color: const Color.fromRGBO(245, 245, 247, 1),
        child: SizedBox.expand(
          child: Center(
              child: AuthShellCard(
                  child: BlocProvider(
            create: (context) => getIt<AuthenticationVerifyCodeBloc>(param1: _username),
            child: BlocListener<AuthenticationVerifyCodeBloc, AuthenticationVerifyCodeState>(
              listener: (context, state) {
                Logger().i('[AuthenticationVerifyCodeState] $state');
                state.mapOrNull(successVerifyCode: (d) => _goToApp(context));
              },
              child: SizedBox(
                width: 320,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text("Kodni kiriting", style: titleTextStyle),
                        IconButton(
                          icon: const Icon(Icons.close_rounded, size: 30, color: Color.fromRGBO(16, 53, 91, 1)),
                          onPressed: () {
                            _goBack(context);
                          },
                        ),
                      ],
                    ),
                    const Padding(
                      padding: EdgeInsets.only(top: 12.0),
                      child: Text(
                        'Telefonni tasdiqlash uchun \nCompanyBot 6 xonali kod yuborildi',
                        style: textStyleForLabel,
                        textAlign: TextAlign.start,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 18.0),
                      child: BlocBuilder<AuthenticationVerifyCodeBloc, AuthenticationVerifyCodeState>(
                        buildWhen: (_, state) {
                          return state.mapOrNull(
                                inputCode: (d) => d.afterFail,
                                loading: (d) => true,
                              ) ??
                              false;
                        },
                        builder: (context, state) {
                          return state.mapOrNull(
                                  inputCode: (d) => PinCodeInputRow(
                                    initWithErrorAnimation: d.afterFail,
                                        toVerify: (code) {
                                          BlocProvider.of<AuthenticationVerifyCodeBloc>(context).code = code;
                                        },
                                      ),
                                  loading: (d) => const LoadingPinCodeInputWidget(),
                                  error: (d) => Center(
                                        child: Text(d.e.toString()),
                                      )) ??
                              const SizedBox();
                        },
                      ),
                    ),
                    Padding(
                        padding: const EdgeInsets.only(top: 12.0),
                        child: ElevatedButton(
                            style: greyButtonStyle,
                            onPressed: _onClickTelegram,
                            child: const Center(
                              child: Text('Telegram Bot'),
                            ))),
                    Padding(
                      padding: const EdgeInsets.only(top: 12.0),
                      child: BlocBuilder<AuthenticationVerifyCodeBloc, AuthenticationVerifyCodeState>(
                        buildWhen: (_, state) {
                          return state.mapOrNull(
                                inputCode: (d) => true,
                                loading: (d) => true,
                              ) ??
                              false;
                        },
                        builder: (context, state) {
                          return state.mapOrNull(
                                  inputCode: (d) => ElevatedButton(
                                      onPressed: () {
                                        BlocProvider.of<AuthenticationVerifyCodeBloc>(context)
                                            .add(const AuthenticationVerifyCodeEvent.verifyCode());
                                      },
                                      child: const Center(
                                          child: Text(
                                        'Ro\'yxatdan o\'tish',
                                        style: TextStyle(color: Colors.white),
                                      ))),
                                  loading: (d) => ElevatedButton(
                                      onPressed: () {},
                                      child: const Center(
                                          child: SizedBox(
                                        height: 20,
                                        width: 20,
                                        child: CircularProgressIndicator(
                                          color: Colors.white,
                                        ),
                                      )))) ??
                              const SizedBox();
                        },
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(top: 10),
                      child: Center(
                        child: Text('Agar kod kelmasa, siz 120 soniya orqali\nyangisini olishingiz mumkin',
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 12,
                              color: Color.fromRGBO(129, 129, 129, 1),
                            ),
                            textAlign: TextAlign.center),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ))),
        ),
      ),
    );
  }
}
