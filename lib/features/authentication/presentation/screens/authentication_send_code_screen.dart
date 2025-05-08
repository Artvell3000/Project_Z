import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_z/core/di/di.dart';
import 'package:project_z/core/routing/router.dart';
import 'package:project_z/features/authentication/presentation/bloc/send_code/authentication_send_code_screen_bloc.dart';
import 'package:project_z/features/authentication/presentation/widgets/widgets.dart';
import 'package:project_z/shared/consts/text_field_style.dart';
import 'package:project_z/shared/consts/text_style_title.dart';
import 'package:project_z/shared/widgets/loading_card.dart';

@RoutePage()
class AuthenticationSendCodeScreen extends StatelessWidget {
  const AuthenticationSendCodeScreen({super.key});

  void _goBack(BuildContext context) {
    final router = AutoRouter.of(context);
    if (router.canPop()) {
      router.popForced();
    }
  }

  void _goToVerifyCode(BuildContext context, String username){
    AutoRouter.of(context).push(AuthenticationVerifyCodeRoute(username: username));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ColoredBox(
        color: const Color.fromRGBO(245, 245, 247, 1),
        child: Center(
            child: AuthShellCard(
                child: BlocProvider(
                  create: (context) => getIt<AuthenticationSendCodeScreenBloc>(),
                  child: BlocListener<AuthenticationSendCodeScreenBloc, AuthenticationSendCodeScreenState>(
                    listener: (context, state) {
                      state.mapOrNull(
                        hasSendCode: (d) => _goToVerifyCode(context, d.phone),
                      );
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
                              const Text("Telefon raqamingizni kiriting", style: titleTextStyle),
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
                            child: Text('Telefon', style: textStyleForLabel),
                          ),
                          BlocBuilder<AuthenticationSendCodeScreenBloc, AuthenticationSendCodeScreenState>(
                            buildWhen: (_, state){
                              return state.mapOrNull(wrongPhoneFormat: (d) => false) ?? true;
                            },
                            builder: (context, state) {
                              return state.mapOrNull(
                                loading: (d) =>
                                const SizedBox(
                                  height: 48,
                                  width: double.infinity,
                                  child: Center(child: LoadingCard()),
                                ),
                                inputData: (d) =>
                                    TextFieldForPhone(
                                      initText: d.phone,
                                      onPhoneEntered: (phone) {
                                        BlocProvider.of<AuthenticationSendCodeScreenBloc>(context).phone = phone;
                                      },
                                    ),
                                hasSendCode: (d) =>
                                    TextFieldForPhone(
                                      initText: d.phone,
                                      onPhoneEntered: (phone) {
                                        BlocProvider.of<AuthenticationSendCodeScreenBloc>(context).phone = phone;
                                      },
                                    ),
                                error: (d) => Text(d.e.toString()),
                              ) ?? const SizedBox();
                            },
                          ),
                          const Padding(padding: EdgeInsets.only(top: 12)),
                      BlocBuilder<AuthenticationSendCodeScreenBloc, AuthenticationSendCodeScreenState>(
                        builder: (context,state){
                          return state.mapOrNull(
                            loading: (d) => ElevatedButton(
                                onPressed: (){}, 
                                child: const Center(child: SizedBox(height: 20, width: 20,child: CircularProgressIndicator(color: Colors.white,),))
                            )
                          ) ?? ElevatedButton(
                              onPressed: (){
                                BlocProvider.of<AuthenticationSendCodeScreenBloc>(context).add(const AuthenticationSendCodeScreenEvent.sendCode());
                              }, 
                              child: const Center(child: Text('Ro\'yxatdan o\'tish', style: TextStyle(color: Colors.white),))
                          );
                        },
                      ),
                          Padding(
                            padding: const EdgeInsets.only(top: 12),
                            child: Center(
                              child: RichText(
                                text: const TextSpan(
                                  children: [
                                    TextSpan(
                                      text: "Akkauntingiz yo'q? ",
                                      style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 12,
                                        color: Color.fromRGBO(129, 129, 129, 1),
                                      ),
                                    ),
                                    TextSpan(
                                      text: "Avtorizatsiyadan o'tish",
                                      style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 12,
                                        color: Color.fromRGBO(16, 53, 91, 1),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ))),
      ),
    );
  }
}
