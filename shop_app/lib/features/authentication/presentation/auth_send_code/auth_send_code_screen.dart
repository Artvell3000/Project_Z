import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_z/config/theme/text_styles_extension.dart';
import 'package:project_z/core/routing/router.dart';
import 'package:project_z/features/authentication/presentation/bloc/auth_screen_bloc.dart';
import 'package:project_z/features/authentication/presentation/widgets/auth_shell_card.dart';
import 'package:project_z/gen_locales/app_localizations.dart';

@RoutePage()
class AuthSendCodeScreen extends StatefulWidget {
  const AuthSendCodeScreen({super.key});

  @override
  State<AuthSendCodeScreen> createState() => _AuthSendCodeScreenState();
}

class _AuthSendCodeScreenState extends State<AuthSendCodeScreen> {

  @override
  Widget build(BuildContext context) {

    final router = AutoRouter.of(context);
    final S = AppLocalizations.of(context);
    final theme = Theme.of(context);
    final scheme = theme.colorScheme;
    final textStyles = theme.extension<AppTextStyles>();

    return Scaffold(
      body: Center(
          child: AuthShellCard(
              child: BlocListener<AuthScreenBloc, AuthScreenState>(
                listener: (context, state) {
                  state.mapOrNull(
                    successSendCode: (d) => router.push(const AuthVerifyCodeRoute()),
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
                          Text(S.authSendCodeTitle, style: textStyles!.heading),
                          IconButton(
                            icon: Icon(Icons.close_rounded, size: 30, color: scheme.primary),
                            onPressed: () {
                              router.popForced();
                            },
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 12.0),
                        child: Text(S.authSendCodePhone, style: textStyles.label),
                      ),

                      
                      Form(
                        child: TextFormField(
                          
                        )
                      ),
                      const Padding(padding: EdgeInsets.only(top: 12)),
                  BlocBuilder<AuthScreenBloc, AuthScreenState>(
                    builder: (context,state){
                      final bloc = BlocProvider.of<AuthScreenBloc>(context);
                      return state.mapOrNull(
                        sendingCode: (d) => ElevatedButton(
                            onPressed: (){}, 
                            child: const Center(child: SizedBox(height: 20, width: 20,child: CircularProgressIndicator(color: Colors.white,),))
                        )
                      ) ?? ElevatedButton(
                          onPressed: (){
                            bloc.add(const AuthScreenEvent.sendCode());
                          }, 
                          child: Center(child: Text(S.registerButtonText, style: const TextStyle(color: Colors.white),))
                      );
                    },
                  ),
                      Padding(
                        padding: const EdgeInsets.only(top: 12),
                        child: Center(
                          child: RichText(
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text: S.authSendCodeQuestion1,
                                  style: const TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 12,
                                    color: Color.fromRGBO(129, 129, 129, 1),
                                  ),
                                ),
                                TextSpan(
                                  text: S.authSendCodeQuestion2,
                                  style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 12,
                                    color: scheme.primary,
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
              ))),
    );
  }
}